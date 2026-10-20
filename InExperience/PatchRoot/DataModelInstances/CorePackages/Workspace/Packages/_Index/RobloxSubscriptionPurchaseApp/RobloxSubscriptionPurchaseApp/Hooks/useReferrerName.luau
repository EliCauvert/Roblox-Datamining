local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserProfilesModule = require(Parent.UserProfiles)

return function(p1)
	-- upvalues: ReactModule (copy), UserProfilesModule (copy), SignalsModule (copy), SignalsReactModule (copy)
	local v1: boolean = p1 ~= nil and p1 ~= 0
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: v1 (copy), p1 (copy), UserProfilesModule (upval)
		return if v1 and p1 then UserProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ (tostring(p1)) }) else nil
	end, { v1, p1 })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), SignalsModule (upval)
		return if UseMemoResult then SignalsModule.createComputed(function(p2)
			-- upvalues: UseMemoResult (upval)
			local UseMemoResultResult = UseMemoResult(p2)
			
			if UseMemoResultResult and UseMemoResultResult.status == "success" and UseMemoResultResult.data and #UseMemoResultResult.data ~= 0 then
				local Entry = UseMemoResultResult.data[1]
				local Names = Entry and Entry.names
				
				return if Names then Names.getDisplayName(p2) or (Names.getUsername(p2) or "") else nil
			else
				return nil
			end
		end) else function(_)
			return nil
		end
	end, { UseMemoResult })))
end