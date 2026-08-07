local _script = script

return {
	presenceSortComparator = require(_script.presenceSortComparator),
	pruneConsecutiveNewLines = require(_script.pruneConsecutiveNewLines),
	formatAlias = require(_script.formatAlias),
	searchFilterPredicate = require(_script.searchFilterPredicate),
	isEnum = require(_script.isEnum)
}