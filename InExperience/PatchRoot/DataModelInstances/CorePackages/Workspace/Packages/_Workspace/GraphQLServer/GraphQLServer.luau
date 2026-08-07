local graphqlModule = require(script.graphql)

return {
	GraphQLServer = require(script.Server),
	types = graphqlModule.generatedTypes,
	mocks = graphqlModule.mocks,
	ApolloClientTestUtils = require(script.ApolloClientTestUtils),
	generateTypeDefs = graphqlModule.generateTypeDefs,
	enums = require(script.graphql.enums),
	["jest.config"] = script["jest.config"]
}