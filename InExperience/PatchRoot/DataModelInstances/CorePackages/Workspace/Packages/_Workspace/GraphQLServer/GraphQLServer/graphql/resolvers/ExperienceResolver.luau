local parent = script:FindFirstAncestor("GraphQLServer").Parent
local promiseModule = require(parent.Promise)
local array = require(parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.generatedTypes)

return {
	Experience = {
		thumbnails = function(p0, _, p1) --[[ line: 10 ]]
			-- upvalues: promiseModule (ref)
			local thumbnails = p1.dataLoaders.thumbnails
			
			return if thumbnails then thumbnails:load(p0.universeId):andThen(function(p2) --[[ line: 17 ]]
				return if p2 then { { url = p2.imageUrl } } else {}
			end):catch(function() --[[ line: 23 ]]
				return {}
			end) else promiseModule.resolve({})
		end
	},
	Query = {
		experienceThumbnails = function(_, p3) --[[ line: 30 ]]
			-- upvalues: array (ref)
			return array.map(p3.universeIds, function(p4) --[[ line: 31 ]]
				return { universeId = p4 }
			end)
		end
	}
}