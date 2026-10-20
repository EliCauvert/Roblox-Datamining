local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local PromiseModule = require(Parent.Promise)
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local GetProfileTrustedFriendActionsModule = require(AppChat.Http.getProfileTrustedFriendActions)
local FFlagProfilePlatformAddTC = require(Parent.SharedFlags).FFlagProfilePlatformAddTC

local function _(RawActionType, ActionType, IsDisabled, ModalVariantOverride)
	return {
		rawActionType = RawActionType,
		actionType = ActionType,
		isDisabled = IsDisabled,
		modalVariantOverride = ModalVariantOverride
	}
end

local function normalizeTrustedFriendAction(List)
	-- upvalues: FFlagProfilePlatformAddTC (copy), Sources (copy)
	for _, RawActionType in List do
		if RawActionType == "RemoveTrustedConnection" then
			return {
				actionType = "RemoveTrustedConnection",
				isDisabled = false,
				modalVariantOverride = nil,
				rawActionType = RawActionType
			}
		end
		if RawActionType == "AddTrustedConnection" then
			if FFlagProfilePlatformAddTC then
				return {
					actionType = "AddTrustedConnection",
					isDisabled = false,
					modalVariantOverride = nil,
					rawActionType = RawActionType
				}
			end
		elseif RawActionType == "AddTrustedConnectionViaLink" then
			return {
				actionType = "AddTrustedConnection",
				isDisabled = false,
				rawActionType = RawActionType,
				modalVariantOverride = Sources.ShareLinkSender
			}
		else
			if RawActionType == "PendingTrustedConnection" then
				if FFlagProfilePlatformAddTC then
					return {
						actionType = "AddTrustedConnection",
						isDisabled = true,
						modalVariantOverride = nil,
						rawActionType = RawActionType
					}
				end
				continue
			elseif RawActionType == "AddIncomingTrustedConnection" then
				if FFlagProfilePlatformAddTC then
					return {
						actionType = "AddIncomingTrustedConnection",
						isDisabled = false,
						modalVariantOverride = nil,
						rawActionType = RawActionType
					}
				end
				continue
			elseif RawActionType == "PendingIncomingTrustedConnection" then
				return {
					actionType = "AddIncomingTrustedConnection",
					isDisabled = true,
					modalVariantOverride = nil,
					rawActionType = RawActionType
				}
			end
			continue
		end
	end
	return nil
end

return function(p1)
	-- upvalues: PromiseModule (copy), GetProfileTrustedFriendActionsModule (copy), normalizeTrustedFriendAction (copy)
	return if p1 == "" then PromiseModule.resolve(nil) else GetProfileTrustedFriendActionsModule(p1):andThen(function(Result)
		-- upvalues: normalizeTrustedFriendAction (upval)
		return (normalizeTrustedFriendAction(Result))
	end):catch(function()
		return nil
	end)
end