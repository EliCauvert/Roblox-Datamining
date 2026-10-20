local GraphqlModule = require(script.graphql)

return {
	GraphQLServer = require(script.Server),
	types = GraphqlModule.generatedTypes,
	mocks = GraphqlModule.mocks,
	ApolloClientTestUtils = require(script.ApolloClientTestUtils),
	generateTypeDefs = GraphqlModule.generateTypeDefs,
	enums = require(script.graphql.enums),
	["jest.config"] = script["jest.config"]
}