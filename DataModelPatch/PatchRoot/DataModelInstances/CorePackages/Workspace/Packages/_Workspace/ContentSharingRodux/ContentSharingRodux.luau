local v1 = script
local Parent = v1.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local ContentSharingNetworkingModule = require(Parent.ContentSharingNetworking)
local ContentSharingReducerModule = require(v1.Reducers.ContentSharingReducer)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: CryoModule (copy), ContentSharingNetworkingModule (copy), RoduxNetworkingModule (copy), ContentSharingReducerModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			ContentSharingNetworking = ContentSharingNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: ContentSharingReducerModule (upval), JoinResult (ref)
				return ContentSharingReducerModule(JoinResult)
			end
		}
	end
}