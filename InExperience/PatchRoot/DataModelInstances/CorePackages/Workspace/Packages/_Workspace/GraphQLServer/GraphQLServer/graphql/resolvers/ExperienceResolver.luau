local parent = script:FindFirstAncestor("GraphQLServer").Parent
local promiseModule = require(parent.Promise)
local array = require(parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.generatedTypes)

return {
	Experience = {
		thumbnails = function(p1, _, p2)
			-- upvalues: promiseModule (ref)
			local thumbnails = p2.dataLoaders.thumbnails
			
			return if thumbnails then thumbnails:load(p1.universeId):andThen(function(p3)
				return if p3 then { { url = p3.imageUrl } } else {}
			end):catch(function()
				return {}
			end) else promiseModule.resolve({})
		end
	},
	Query = {
		experienceThumbnails = function(_, p1)
			-- upvalues: array (ref)
			return array.map(p1.universeIds, function(p2)
				return { universeId = p2 }
			end)
		end
	}
}