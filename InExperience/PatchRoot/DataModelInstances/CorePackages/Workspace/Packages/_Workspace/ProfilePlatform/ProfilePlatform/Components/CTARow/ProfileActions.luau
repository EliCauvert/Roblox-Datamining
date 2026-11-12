local CallActionModule = require(script.CallAction)
local PlayExperienceActionModule = require(script.PlayExperienceAction)
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local SupportedProfileTypesModule = require(script.SupportedProfileTypes)
local SharedFlagsModule = require(ProfilePlatform.Parent.SharedFlags)
local FFlagJoinabilityCTARefactor = SharedFlagsModule.FFlagJoinabilityCTARefactor
local t = {}
local List = {
	require(script.AcceptFriendRequestActions), require(script.AddFriendActions),
	require(script.BlockActions), require(script.ChatAction),
	require(script.CommunityActions), require(script.CurrencyTransferAction),
	require(script.EditAliasAction), require(script.EditAppearanceActions),
	require(script.EditProfileAction), require(script.FollowActions),
	require(script.IgnoreFriendRequestAction),
	require(script.JoinExperienceAction),
	require(script.PendingFriendRequestAction), require(script.QrCodeAction),
	require(script.ReportAction), require(script.ShareProfileAction),
	require(script.TradeItemsAction), require(script.TrustedConnectionActions),
	require(script.UnfriendAction), require(script.UnlockChatAction),
	require(script.ViewAboutAction), (require(script.ViewPlatformProfileAction))
}

if SharedFlagsModule.FFlagFriendsCallingClientGate_DEV then
	table.insert(List, CallActionModule)
end
if FFlagJoinabilityCTARefactor then
	table.insert(List, PlayExperienceActionModule)
end
local function _(Value, Callback)
	-- upvalues: SupportedProfileTypesModule (copy)
	return function(p1)
		-- upvalues: Callback (copy), Value (copy), SupportedProfileTypesModule (upval)
		local CallbackResult = Callback(p1)
		
		if CallbackResult ~= nil then
			assert(type(CallbackResult.onActivated) == "table", Value .. " has onActivated as " .. type(CallbackResult.onActivated) .. ", expected table")
			
			for i in CallbackResult.onActivated do
				local SupportedProfileTypesModuleEntry = SupportedProfileTypesModule[i]
				assert(SupportedProfileTypesModuleEntry and table.find(SupportedProfileTypesModuleEntry, Value), Value .. " has onActivated for " .. tostring(i) .. " but is missing from SupportedProfileTypes")
			end
		end
		return CallbackResult
	end
end

for _, value in List do
	for i1, value3 in value do
		assert(t[i1] == nil, "Duplicate ProfileAction key: " .. tostring(i1))
		
		t[i1] = function(p1)
			-- upvalues: value3 (copy), i1 (copy), SupportedProfileTypesModule (copy)
			local CallbackResult = value3(p1)
			
			if CallbackResult ~= nil then
				assert(type(CallbackResult.onActivated) == "table", i1 .. " has onActivated as " .. type(CallbackResult.onActivated) .. ", expected table")
				
				for i in CallbackResult.onActivated do
					local SupportedProfileTypesModuleEntry = SupportedProfileTypesModule[i]
					assert(SupportedProfileTypesModuleEntry and table.find(SupportedProfileTypesModuleEntry, i1), i1 .. " has onActivated for " .. tostring(i) .. " but is missing from SupportedProfileTypes")
				end
			end
			return CallbackResult
		end
	end
end
for i, value1 in SupportedProfileTypesModule do
	for _, value2 in value1 do
		assert(t[value2] ~= nil, value2 .. " is listed in SupportedProfileTypes for " .. tostring(i) .. " but has no matching factory")
	end
end
return t