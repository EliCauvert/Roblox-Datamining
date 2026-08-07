local t = {}
local parent = script.Parent
local parent_1 = parent.Parent
local DEV = require(script.globals).DEV
require(parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", tostring(DEV))
t.DEV = DEV
local object = require(parent_1.LuauPolyfill).Object
t.NULL = require(script.globals).NULL
local directivesModule = require(script.graphql.directives)
t.shouldInclude = directivesModule.shouldInclude
t.hasDirectives = directivesModule.hasDirectives
t.hasClientExports = directivesModule.hasClientExports
t.getDirectiveNames = directivesModule.getDirectiveNames
t.getInclusionDirectives = directivesModule.getInclusionDirectives
local fragmentsModule = require(script.graphql.fragments)
t.createFragmentMap = fragmentsModule.createFragmentMap
t.getFragmentQueryDocument = fragmentsModule.getFragmentQueryDocument
t.getFragmentFromSelection = fragmentsModule.getFragmentFromSelection
local getFromASTModule = require(script.graphql.getFromAST)
t.checkDocument = getFromASTModule.checkDocument
t.getOperationDefinition = getFromASTModule.getOperationDefinition
t.getOperationName = getFromASTModule.getOperationName
t.getFragmentDefinitions = getFromASTModule.getFragmentDefinitions
t.getQueryDefinition = getFromASTModule.getQueryDefinition
t.getFragmentDefinition = getFromASTModule.getFragmentDefinition
t.getMainDefinition = getFromASTModule.getMainDefinition
t.getDefaultValues = getFromASTModule.getDefaultValues
local storeUtilsModule = require(script.graphql.storeUtils)
t.makeReference = storeUtilsModule.makeReference
t.isDocumentNode = storeUtilsModule.isDocumentNode
t.isReference = storeUtilsModule.isReference
t.isField = storeUtilsModule.isField
t.isInlineFragment = storeUtilsModule.isInlineFragment
t.valueToObjectRepresentation = storeUtilsModule.valueToObjectRepresentation
t.storeKeyNameFromField = storeUtilsModule.storeKeyNameFromField
t.argumentsObjectFromField = storeUtilsModule.argumentsObjectFromField
t.resultKeyNameFromField = storeUtilsModule.resultKeyNameFromField
t.getStoreKeyName = storeUtilsModule.getStoreKeyName
t.getTypenameFromResult = storeUtilsModule.getTypenameFromResult
local transformModule = require(script.graphql.transform)
t.addTypenameToDocument = transformModule.addTypenameToDocument
t.buildQueryFromSelectionSet = transformModule.buildQueryFromSelectionSet
t.removeDirectivesFromDocument = transformModule.removeDirectivesFromDocument
t.removeConnectionDirectiveFromDocument = transformModule.removeConnectionDirectiveFromDocument
t.removeArgumentsFromDocument = transformModule.removeArgumentsFromDocument
t.removeFragmentSpreadFromDocument = transformModule.removeFragmentSpreadFromDocument
t.removeClientSetsFromDocument = transformModule.removeClientSetsFromDocument
local paginationModule = require(script.policies.pagination)
t.concatPagination = paginationModule.concatPagination
t.offsetLimitPagination = paginationModule.offsetLimitPagination
t.relayStylePagination = paginationModule.relayStylePagination
t.Observable = require(script.observables.Observable).Observable
object.assign(t, require(script.common.mergeDeep))
object.assign(t, require(script.common.cloneDeep))
object.assign(t, require(script.common.maybeDeepFreeze))
object.assign(t, require(script.common.stringifyForDisplay))
object.assign(t, require(script.observables.iteration))
object.assign(t, require(script.observables.asyncMap))
object.assign(t, require(script.observables.Concast))
object.assign(t, require(script.observables.subclassing))
object.assign(t, require(script.common.arrays))
object.assign(t, require(script.common.objects))
object.assign(t, require(script.common.errorHandling))
object.assign(t, require(script.common.canUse))
object.assign(t, require(script.common.compact))
object.assign(t, require(script.common.makeUniqueId))

return t