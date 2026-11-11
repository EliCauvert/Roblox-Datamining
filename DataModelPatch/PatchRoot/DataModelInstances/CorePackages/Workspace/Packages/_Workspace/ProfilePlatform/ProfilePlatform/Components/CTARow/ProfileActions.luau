local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local SupportedProfileTypesModule = require(script.SupportedProfileTypes)
local t = {}

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

for _, value in {
	require(script.AcceptFriendRequestActions), require(script.AddFriendActions),
	require(script.BlockActions), require(script.ChatAction),
	require(script.CommunityActions), require(script.CurrencyTransferAction),
	require(script.EditAliasAction), require(script.EditAppearanceActions),
	require(script.EditProfileAction), require(script.FollowActions),
	require(script.IgnoreFriendRequestAction),
	require(script.JoinExperienceAction),
	require(script.PendingFriendRequestAction), require(script.QrCodeAction),
	require(script.ReportAction), require(script.ShareProfileAction),
	require(script.TrustedConnectionActions), require(script.UnfriendAction),
	require(script.UnlockChatAction), require(script.ViewAboutAction),
	(require(script.ViewPlatformProfileAction))
} do
	for i, value1 in value do
		assert(t[i] == nil, "Duplicate ProfileAction key: " .. tostring(i))
		
		t[i] = function(p1)
			-- upvalues: value1 (copy), i (copy), SupportedProfileTypesModule (copy)
			local CallbackResult = value1(p1)
			
			if CallbackResult ~= nil then
				assert(type(CallbackResult.onActivated) == "table", i .. " has onActivated as " .. type(CallbackResult.onActivated) .. ", expected table")
				
				for i in CallbackResult.onActivated do
					local SupportedProfileTypesModuleEntry = SupportedProfileTypesModule[i]
					assert(SupportedProfileTypesModuleEntry and table.find(SupportedProfileTypesModuleEntry, i), i .. " has onActivated for " .. tostring(i) .. " but is missing from SupportedProfileTypes")
				end
			end
			return CallbackResult
		end
	end
end
for i1, value2 in SupportedProfileTypesModule do
	for _, value3 in value2 do
		assert(t[value3] ~= nil, value3 .. " is listed in SupportedProfileTypes for " .. tostring(i1) .. " but has no matching factory")
	end
end
return t