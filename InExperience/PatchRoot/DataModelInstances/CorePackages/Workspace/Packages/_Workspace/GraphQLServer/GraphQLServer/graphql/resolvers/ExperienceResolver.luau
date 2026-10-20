local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local PromiseModule = require(Parent.Promise)
local Array = require(Parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.generatedTypes)

return {
	Experience = {
		thumbnails = function(p1, _, p2)
			-- upvalues: PromiseModule (copy)
			local Thumbnails = p2.dataLoaders.thumbnails
			
			return if Thumbnails then Thumbnails:load(p1.universeId):andThen(function(Result)
				return if Result then { { url = Result.imageUrl } } else {}
			end):catch(function()
				return {}
			end) else PromiseModule.resolve({})
		end
	},
	Query = {
		experienceThumbnails = function(_, p1)
			-- upvalues: Array (copy)
			return Array.map(p1.universeIds, function(UniverseId)
				return { universeId = UniverseId }
			end)
		end
	}
}