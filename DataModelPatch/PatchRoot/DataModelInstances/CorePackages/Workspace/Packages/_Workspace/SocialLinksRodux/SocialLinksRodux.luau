local v1 = script
local Parent = v1.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local SocialLinksNetworkingModule = require(Parent.SocialLinksNetworking)
local SocialLinksReducerModule = require(v1.Reducers.SocialLinksReducer)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: CryoModule (copy), SocialLinksNetworkingModule (copy), RoduxNetworkingModule (copy), SocialLinksReducerModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			SocialLinksNetworking = SocialLinksNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: SocialLinksReducerModule (upval), JoinResult (ref)
				return SocialLinksReducerModule(JoinResult)
			end
		}
	end
}