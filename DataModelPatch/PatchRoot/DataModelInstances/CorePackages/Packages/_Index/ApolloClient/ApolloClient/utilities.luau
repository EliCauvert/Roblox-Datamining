local UtilitiesModule = {}
local Parent = script.Parent
local Parent1 = Parent.Parent
local DEV = require(script.globals).DEV
require(Parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", (tostring(DEV)))
UtilitiesModule.DEV = DEV
local Object = require(Parent1.LuauPolyfill).Object
UtilitiesModule.NULL = require(script.globals).NULL
local DirectivesModule = require(script.graphql.directives)
UtilitiesModule.shouldInclude = DirectivesModule.shouldInclude
UtilitiesModule.hasDirectives = DirectivesModule.hasDirectives
UtilitiesModule.hasClientExports = DirectivesModule.hasClientExports
UtilitiesModule.getDirectiveNames = DirectivesModule.getDirectiveNames
UtilitiesModule.getInclusionDirectives = DirectivesModule.getInclusionDirectives
local FragmentsModule = require(script.graphql.fragments)
UtilitiesModule.createFragmentMap = FragmentsModule.createFragmentMap
UtilitiesModule.getFragmentQueryDocument = FragmentsModule.getFragmentQueryDocument
UtilitiesModule.getFragmentFromSelection = FragmentsModule.getFragmentFromSelection
local GetFromASTModule = require(script.graphql.getFromAST)
UtilitiesModule.checkDocument = GetFromASTModule.checkDocument
UtilitiesModule.getOperationDefinition = GetFromASTModule.getOperationDefinition
UtilitiesModule.getOperationName = GetFromASTModule.getOperationName
UtilitiesModule.getFragmentDefinitions = GetFromASTModule.getFragmentDefinitions
UtilitiesModule.getQueryDefinition = GetFromASTModule.getQueryDefinition
UtilitiesModule.getFragmentDefinition = GetFromASTModule.getFragmentDefinition
UtilitiesModule.getMainDefinition = GetFromASTModule.getMainDefinition
UtilitiesModule.getDefaultValues = GetFromASTModule.getDefaultValues
local StoreUtilsModule = require(script.graphql.storeUtils)
UtilitiesModule.makeReference = StoreUtilsModule.makeReference
UtilitiesModule.isDocumentNode = StoreUtilsModule.isDocumentNode
UtilitiesModule.isReference = StoreUtilsModule.isReference
UtilitiesModule.isField = StoreUtilsModule.isField
UtilitiesModule.isInlineFragment = StoreUtilsModule.isInlineFragment
UtilitiesModule.valueToObjectRepresentation = StoreUtilsModule.valueToObjectRepresentation
UtilitiesModule.storeKeyNameFromField = StoreUtilsModule.storeKeyNameFromField
UtilitiesModule.argumentsObjectFromField = StoreUtilsModule.argumentsObjectFromField
UtilitiesModule.resultKeyNameFromField = StoreUtilsModule.resultKeyNameFromField
UtilitiesModule.getStoreKeyName = StoreUtilsModule.getStoreKeyName
UtilitiesModule.getTypenameFromResult = StoreUtilsModule.getTypenameFromResult
local TransformModule = require(script.graphql.transform)
UtilitiesModule.addTypenameToDocument = TransformModule.addTypenameToDocument
UtilitiesModule.buildQueryFromSelectionSet = TransformModule.buildQueryFromSelectionSet
UtilitiesModule.removeDirectivesFromDocument = TransformModule.removeDirectivesFromDocument
UtilitiesModule.removeConnectionDirectiveFromDocument = TransformModule.removeConnectionDirectiveFromDocument
UtilitiesModule.removeArgumentsFromDocument = TransformModule.removeArgumentsFromDocument
UtilitiesModule.removeFragmentSpreadFromDocument = TransformModule.removeFragmentSpreadFromDocument
UtilitiesModule.removeClientSetsFromDocument = TransformModule.removeClientSetsFromDocument
local PaginationModule = require(script.policies.pagination)
UtilitiesModule.concatPagination = PaginationModule.concatPagination
UtilitiesModule.offsetLimitPagination = PaginationModule.offsetLimitPagination
UtilitiesModule.relayStylePagination = PaginationModule.relayStylePagination
UtilitiesModule.Observable = require(script.observables.Observable).Observable
Object.assign(UtilitiesModule, require(script.common.mergeDeep))
Object.assign(UtilitiesModule, require(script.common.cloneDeep))
Object.assign(UtilitiesModule, require(script.common.maybeDeepFreeze))
Object.assign(UtilitiesModule, require(script.common.stringifyForDisplay))
Object.assign(UtilitiesModule, require(script.observables.iteration))
Object.assign(UtilitiesModule, require(script.observables.asyncMap))
Object.assign(UtilitiesModule, (require(script.observables.Concast)))
Object.assign(UtilitiesModule, require(script.observables.subclassing))
Object.assign(UtilitiesModule, require(script.common.arrays))
Object.assign(UtilitiesModule, require(script.common.objects))
Object.assign(UtilitiesModule, require(script.common.errorHandling))
Object.assign(UtilitiesModule, require(script.common.canUse))
Object.assign(UtilitiesModule, require(script.common.compact))
Object.assign(UtilitiesModule, require(script.common.makeUniqueId))

return UtilitiesModule