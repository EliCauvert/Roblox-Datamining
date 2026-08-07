local acceptFriendRequestActionsModule = require(script.AcceptFriendRequestActions)
local addFriendActionsModule = require(script.AddFriendActions)
local blockActionsModule = require(script.BlockActions)
local chatActionModule = require(script.ChatAction)
local communityActionsModule = require(script.CommunityActions)
local currencyTransferActionModule = require(script.CurrencyTransferAction)
local editAliasActionModule = require(script.EditAliasAction)
local editAppearanceActionsModule = require(script.EditAppearanceActions)
local editProfileActionModule = require(script.EditProfileAction)
local followActionsModule = require(script.FollowActions)
local ignoreFriendRequestActionModule = require(script.IgnoreFriendRequestAction)
local joinExperienceActionModule = require(script.JoinExperienceAction)
local pendingFriendRequestActionModule = require(script.PendingFriendRequestAction)
local qrCodeActionModule = require(script.QrCodeAction)
local reportActionModule = require(script.ReportAction)
local shareProfileActionModule = require(script.ShareProfileAction)
local trustedConnectionActionsModule = require(script.TrustedConnectionActions)
local unfriendActionModule = require(script.UnfriendAction)
local unlockChatActionModule = require(script.UnlockChatAction)
local viewAboutActionModule = require(script.ViewAboutAction)
local viewPlatformProfileActionModule = require(script.ViewPlatformProfileAction)
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local supportedProfileTypesModule = require(script.SupportedProfileTypes)
local t = {}

local function _(p0, p1) --[[ line: 54 | named "withValidation" ]]
	-- upvalues: supportedProfileTypesModule (ref)
	return function(p2) --[[ line: 55 ]]
		-- upvalues: p1 (ref), p0 (ref), supportedProfileTypesModule (copy)
		local var24 = p1(p2)
		
		if var24 ~= nil then
			assert(type(var24.onActivated) == "table", p0 .. " has onActivated as " .. type(var24.onActivated) .. ", expected table")
			
			for i in var24.onActivated do
				local var25 = supportedProfileTypesModule[i]
				assert(var25 and table.find(var25, p0), p0 .. " has onActivated for " .. tostring(i) .. " but is missing from SupportedProfileTypes")
			end
		end
		return var24
	end
end

for i, v in {
	acceptFriendRequestActionsModule, addFriendActionsModule, blockActionsModule,
	chatActionModule, communityActionsModule, currencyTransferActionModule,
	editAliasActionModule, editAppearanceActionsModule, editProfileActionModule,
	followActionsModule, ignoreFriendRequestActionModule,
	joinExperienceActionModule, pendingFriendRequestActionModule,
	qrCodeActionModule, reportActionModule, shareProfileActionModule,
	trustedConnectionActionsModule, unfriendActionModule, unlockChatActionModule,
	viewAboutActionModule, viewPlatformProfileActionModule
} do
	for i_1, v_1 in v do
		assert(t[i_1] == nil, "Duplicate ProfileAction key: " .. tostring(i_1))
		
		t[i_1] = function(p3) --[[ line: 55 ]]
			-- upvalues: v_1 (ref), i_1 (ref), supportedProfileTypesModule (ref)
			local var24 = v_1(p3)
			
			if var24 ~= nil then
				assert(type(var24.onActivated) == "table", i_1 .. " has onActivated as " .. type(var24.onActivated) .. ", expected table")
				
				for i in var24.onActivated do
					local var25 = supportedProfileTypesModule[i]
					assert(var25 and table.find(var25, i_1), i_1 .. " has onActivated for " .. tostring(i) .. " but is missing from SupportedProfileTypes")
				end
			end
			return var24
		end
	end
end
for i_1, v_1 in supportedProfileTypesModule do
	for i_2, v_2 in v_1 do
		assert(t[v_2] ~= nil, v_2 .. " is listed in SupportedProfileTypes for " .. tostring(i_1) .. " but has no matching factory")
	end
end
return t