// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import "package:amplify_core/amplify_core.dart";
import "package:secondary_index_list_for_amplify/graphql_request_factory.dart";

class ModelQueriesFactory {
  // Singleton methods/properties
  // usage: ModelQueriesFactory.instance;
  ModelQueriesFactory._();

  static final ModelQueriesFactory _instance = ModelQueriesFactory._();

  static ModelQueriesFactory get instance => _instance;

  GraphQLRequest<PaginatedResult<T>> listByIndex<T extends Model>(
    ModelType<T> modelType, {
    int? limit,
    QueryPredicate? where,
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
    String? queryField,
    String? sortDirection,
    String? indexName,
    String? overrideQueryFieldType,
    String? customQueryName,
  }) {
    final filter = GraphQLRequestFactory.instance
        .queryPredicateToGraphQLFilter(where, modelType);
    final variables = GraphQLRequestFactory.instance
        .buildVariablesForListRequest(limit: limit, filter: filter);

    return GraphQLRequestFactory.instance
        .buildRequestForSecondaryIndex<PaginatedResult<T>>(
      modelType: PaginatedModelType(modelType),
      variables: variables,
      requestType: GraphQLRequestType.query,
      requestOperation: "listWithIndex",
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
      queryField: queryField,
      sortDirection: sortDirection,
      indexName: indexName,
      overrideQueryFieldType: overrideQueryFieldType,
      customQueryName: customQueryName,
    );
  }
}
