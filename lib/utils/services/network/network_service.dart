part of 'index.dart';

/// A base class for a network clients.
abstract class NetworkBaseService {
  Future<dynamic> get({
    required String url,
    required Map<String, dynamic> parameters,
  });
  Future<Stream<String>> getAsStream({
    required String url,
    required Map<String, dynamic> parameters,
  });

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
    bool getUnprocessedException,
  });

  Future<dynamic> postFile({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
    Map<String, dynamic>? headers,
  });
  Future<String> postUnauthenticated({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  });
  Future<dynamic> patch({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  });

  Future<String> put({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  });

  Future delete({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  });

  Future<void> download({
    required String url,
    required String savePath,
    required ResponseType responseType,
  });
}

/// A network service class for making HTTP requests.
class NetworkImplService implements NetworkBaseService {
  final Dio _dioUnsigned = Dio();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: (appFlavor == "dev")
          ? AppConstants.baseDevUrl
          : AppConstants.baseUrl,
    ),
  );
  final SharedPreferencesService prefs;

  NetworkImplService(this.prefs);

  @override
  Future<dynamic> get({
    required String url,
    required Map<String, dynamic> parameters,
    bool isUnsigned = false,
  }) async {
    try {
      if (isUnsigned) {
        final response = await _performUnsignedGet(url, parameters, _header());
        return response.data;
      }
      final response = await _performGet(url, parameters, _header());
      return response.data;
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<Stream<String>> getAsStream({
    required String url,
    required Map<String, dynamic> parameters,
  }) async {
    try {
      return await _performGetAsStream(url, parameters, _header());
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> parameters,
    required data,
    bool getUnprocessedException = false,
  }) async {
    try {
      final response = await _performPost(url, data, parameters, _header());
      return response.data;
    } on DioException catch (d) {
      if (getUnprocessedException) {
        rethrow;
      }
      throw _handleException(d);
    } on Exception catch (_) {
      if (getUnprocessedException) {
        rethrow;
      }
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<dynamic> postFile({
    required String url,
    required Map<String, dynamic> parameters,
    required data,
    Map<String, dynamic>? headers,
    Function(int sent, int total)? onSendProgress,
  }) async {
    try {
      final response = _performPostFile(url, data, parameters, {
        ...headers ?? {},
        ..._header(showContentType: false, showToken: false),
      }, onSendProgress);
      return response;
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<String> postUnauthenticated({
    required String url,
    required Map<String, dynamic> parameters,
    required data,
  }) async {
    try {
      final response = await _performPost(url, data, parameters, {});
      return response.data;
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<dynamic> patch({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  }) async {
    try {
      final response = await _performPatch(url, data, parameters, _header());
      return response.data;
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<String> put({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  }) async {
    try {
      final response = await _performPut(url, data, parameters, _header());
      return json.decode(response.data);
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future delete({
    required String url,
    required Map<String, dynamic> parameters,
    required dynamic data,
  }) async {
    try {
      final response = await _performDelete(url, data, parameters, _header());
      return json.decode(response.data);
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  @override
  Future<void> download({
    required String url,
    required String savePath,
    required ResponseType responseType,
  }) async {
    try {
      await _performDownload(url, savePath, responseType);
    } on DioException catch (d) {
      throw _handleException(d);
    } on Exception catch (_) {
      throw _handleDefaultNetworkException();
    }
  }

  Future<Response<dynamic>> _performDownload(
    String url,
    String savePath,
    ResponseType responseType,
  ) async {
    return _dioUnsigned.download(
      url,
      savePath,
      options: Options(responseType: responseType),
    );
  }

  Future<Response<dynamic>> _performDelete(
    String url,
    dynamic data,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    return _dio.delete<String>(
      url,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> _performPost(
    String url,
    dynamic data,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    return _dio.post<String>(
      url,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> _performPostFile(
    String signedUrl,
    dynamic data,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
    Function(int sent, int total)? onSendProgress,
  ) async {
    return _dioUnsigned.post<dynamic>(
      signedUrl,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> _performPut(
    String url,
    dynamic data,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    return _dio.put<String>(
      url,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> _performPatch(
    String url,
    dynamic data,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    return _dio.patch<String>(
      url,
      data: data,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> _performGet(
    String url,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    return _dio.get<String>(
      url,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> _performUnsignedGet(
    String url,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    return _dioUnsigned.get<String>(
      url,
      queryParameters: params,
      options: Options(headers: headers),
    );
  }

  Future<Stream<String>> _performGetAsStream(
    String url,
    Map<String, dynamic> params,
    Map<String, dynamic> headers,
  ) async {
    final rs = await _dio.get<ResponseBody>(
      url,
      queryParameters: params,
      options: Options(responseType: ResponseType.stream, headers: headers),
    );

    return rs.data!.stream.map(
      (event) => utf8.decode(Uint8List.fromList(event)),
    );
  }

  Map<String, String> _header({
    bool showContentType = true,
    bool showToken = true,
  }) {
    final authToken = prefs.getString(SharedPreferencesKeys.authToken);
    return {
      if (showContentType) 'Content-Type': 'application/json; charset=UTF-8',
      'Device-Source': 'mobile',
      if (authToken != null && showToken) 'Authorization': "Bearer $authToken",
    };
  }

  NetworkException _handleDefaultNetworkException() {
    return NetworkException(
      //todo: enter a valid error message here after AppLocalization is implemented
      'Network Error',
    );
  }

  NetworkException _handleException(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        return _handleResponseError(e);
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'The request has timed out. Please check your internet connection and try again.',
        );
      case DioExceptionType.cancel:
        return CancelledRequestException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'The request has been cancelled. Please try again.',
        );
      default:
        return _handleDefaultNetworkException();
    }
  }

  NetworkException _handleResponseError(DioException e) {
    switch (e.response!.statusCode) {
      case 400:
        return BadRequestException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'Bad request. Please check your request parameters and try again.',
        );
      case 401:
        return UnauthorizedException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'You are not authorized to perform this action. Please check your credentials and try again.',
        );
      case 403:
        return ForbiddenRequestException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'You do not have permission to access this resource. Please check your credentials and try again.',
        );
      case 404:
        return NotFoundException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'The requested resource could not be found. Please check your request parameters and try again.',
        );
      case 500:
        return ServerException(
          //todo: enter a valid error message here after AppLocalization is implemented
          'An internal server error occurred. Please try again later.',
        );
      default:
        return _handleDefaultNetworkException();
    }
  }
}
