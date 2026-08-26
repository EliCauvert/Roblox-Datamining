local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local getProfileTrustedFriendActionsModule = require(appChat.Http.getProfileTrustedFriendActions)
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local pendingIncomingTrustedConnection = game:DefineFastFlag("PendingIncomingTrustedConnection", false)

local function _(p1, p2, p3, p4)
	return {
		rawActionType = p1,
		actionType = p2,
		isDisabled = p3,
		modalVariantOverride = p4
	}
end

local function normalizeTrustedFriendAction(p1)
	-- upvalues: fFlagProfilePlatformAddTC (ref), sources (ref), pendingIncomingTrustedConnection (ref)
	for i, v in p1 do
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

return function(p2)
	-- upvalues: promiseModule (ref), getProfileTrustedFriendActionsModule (ref), normalizeTrustedFriendAction (ref)
	return if p2 == "" then promiseModule.resolve(nil) else getProfileTrustedFriendActionsModule(p2):andThen(function(p3)
		-- upvalues: normalizeTrustedFriendAction (copy)
		return normalizeTrustedFriendAction(p3)
	end):catch(function()
		return nil
	end)
end