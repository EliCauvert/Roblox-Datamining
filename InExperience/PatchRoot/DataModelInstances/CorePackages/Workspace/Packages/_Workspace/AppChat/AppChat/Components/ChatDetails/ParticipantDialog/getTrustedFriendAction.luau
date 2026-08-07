local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local getProfileTrustedFriendActionsModule = require(appChat.Http.getProfileTrustedFriendActions)
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local pendingIncomingTrustedConnection = game:DefineFastFlag("PendingIncomingTrustedConnection", false)

local function _(p0, p1, p2, p3) --[[ line: 22 | named "createTrustedFriendAction" ]]
	return {
		rawActionType = p0,
		actionType = p1,
		isDisabled = p2,
		modalVariantOverride = p3
	}
end

local function normalizeTrustedFriendAction(p4) --[[ line: 36 ]]
	-- upvalues: fFlagProfilePlatformAddTC (ref), sources (ref), pendingIncomingTrustedConnection (ref)
	for i, v in p4 do
		if v ~= "RemoveTrustedConnection" then
			if v == "AddTrustedConnection" then
				if fFlagProfilePlatformAddTC then
					return {
						actionType = "AddTrustedConnection",
						isDisabled = false,
						modalVariantOverride = nil,
						rawActionType = v
					}
				end
			elseif v ~= "AddTrustedConnectionViaLink" then
				if v == "PendingTrustedConnection" then
					if fFlagProfilePlatformAddTC then
						return {
							actionType = "AddTrustedConnection",
							isDisabled = true,
							modalVariantOverride = nil,
							rawActionType = v
						}
					end
				elseif v == "AddIncomingTrustedConnection" then
					if fFlagProfilePlatformAddTC then
						return {
							actionType = "AddIncomingTrustedConnection",
							isDisabled = false,
							modalVariantOverride = nil,
							rawActionType = v
						}
					end
				elseif v == "PendingIncomingTrustedConnection" and pendingIncomingTrustedConnection then
					return {
						actionType = "AddIncomingTrustedConnection",
						isDisabled = true,
						modalVariantOverride = nil,
						rawActionType = v
					}
				end
			end
			return {
				actionType = "AddTrustedConnection",
				isDisabled = false,
				rawActionType = v,
				modalVariantOverride = sources.ShareLinkSender
			}
		end
		return {
			actionType = "RemoveTrustedConnection",
			isDisabled = false,
			modalVariantOverride = nil,
			rawActionType = v
		}
	end
	return nil
end

return function(p5) --[[ line: 64 | named "getTrustedFriendAction" ]]
	-- upvalues: promiseModule (ref), getProfileTrustedFriendActionsModule (ref), normalizeTrustedFriendAction (ref)
	return if p5 == "" then promiseModule.resolve(nil) else getProfileTrustedFriendActionsModule(p5):andThen(function(p6) --[[ line: 70 ]]
		-- upvalues: normalizeTrustedFriendAction (copy)
		return normalizeTrustedFriendAction(p6)
	end):catch(function() --[[ line: 73 ]]
		return nil
	end)
end