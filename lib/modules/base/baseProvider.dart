import 'package:MobileFlutterTest/env.dart';
import 'package:MobileFlutterTest/modules/base/defaultModel.dart';
import 'package:graphql/client.dart';

class BaseProvider {
  final String _token = environment['secret'];
  final String _endpoint = environment['endpoint'];

  Future<DefaultModel<T>> readGraphQl<T>(
      String query, T Function(dynamic readGraph) callback) async {
    DefaultModel<T> resultObject = DefaultModel<T>();

    resultObject.isSuccess = false;

    final HttpLink _httpLink =
        HttpLink(uri: _endpoint, headers: {'x-hasura-access-key': _token});

    final GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );

    final QueryOptions options = QueryOptions(documentNode: gql(query));

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      resultObject.isSuccess = false;
      resultObject.error = result.exception;
    }

    if (result.data != null) {
      resultObject.isSuccess = true;
      resultObject.data = callback(result.data);
    }

    return resultObject;
  }
}
