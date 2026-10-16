local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local PromiseModule = require(Parent.Promise)
local Array = require(Parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.generatedTypes)

return {
	Experience = {
		thumbnails = function(p1, _, p2) --[[ Line: 10 ]]
			-- upvalues: PromiseModule (copy)
			local Thumbnails = p2.dataLoaders.thumbnails
			
			return if Thumbnails then Thumbnails:load(p1.universeId):andThen(function(Result) --[[ Line: 17 ]]
				return if Result then { { url = Result.imageUrl } } else {}
			end):catch(function() --[[ Line: 23 ]]
				return {}
			end) else PromiseModule.resolve({})
		end
	},
	Query = {
		experienceThumbnails = function(_, p1) --[[ Line: 30 ]]
			-- upvalues: Array (copy)
			return Array.map(p1.universeIds, function(UniverseId) --[[ Line: 31 ]]
				return { universeId = UniverseId }
			end)
		end
	}
}