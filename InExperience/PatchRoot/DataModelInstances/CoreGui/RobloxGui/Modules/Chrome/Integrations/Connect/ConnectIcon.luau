local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local usePartyIconModule = require(chrome.Integrations.Party.usePartyIcon)
local mappedSignal = chromeUtilsModule.MappedSignal
local useTokens = foundationModule.Hooks.useTokens
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local subMenuContextModule = require(chrome.ChromeShared.Unibar.SubMenuContext)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local getAppChatNavbarItemConfigModule = require(corePackagesService.Workspace.Packages.AppChat.getAppChatNavbarItemConfig)
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local fFlagEnableChatIconUnibarDropdownFixEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableChatIconUnibarDropdownFixEnabled
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local var11 = getAppChatNavbarItemConfigModule()
local off = var11.icon.off
local on = var11.icon.on
local t = {
	integrationId = "",
	shouldShowCustomBadge = true,
	isSquadIndicatorEnabled = false
}

return function(p0) --[[ line: 48 | named "ConnectIcon" ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), mappedSignal (ref), useMappedSignal (ref), usePartyIconModule (ref), on (ref), off (ref), subMenuContextModule (ref), fFlagEnableChatIconUnibarDropdownFixEnabled (ref), foundationModule (ref), argoPartyExperimentation (ref), var11 (ref)
	local var13 = cryoModule.Dictionary.union(t, p0)
	local var14 = useTokens()
	local _ = nil
	local var15 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
	local var16, var17 = reactModule.useState(inExperienceAppChatModalModule.default.unreadCount)
	
	if var13.shouldShowCustomBadge then
		reactModule.useEffect(function() --[[ line: 63 ]]
			-- upvalues: inExperienceAppChatModalModule (copy), var17 (ref)
			local eventConnection = inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p1) --[[ line: 64 ]]
				-- upvalues: var17 (copy)
				var17(p1)
			end)
			
			return function() --[[ line: 67 ]]
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var17 })
	else
		var16 = 0
	end
	local var18 = nil
	local var19 = nil
	local contrast = nil
	
	if var13.isSquadIndicatorEnabled then
		local var20, var21 = reactModule.useState(inExperienceAppChatModalModule.default.currentSquadId)
		var18 = var20
		var19 = var21
	end
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: var13 (ref), inExperienceAppChatModalModule (copy), var19 (write)
		if var13.isSquadIndicatorEnabled then
			local eventConnection = inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p2) --[[ line: 83 ]]
				-- upvalues: var19 (copy)
				var19(p2)
			end)
			
			return function() --[[ line: 87 ]]
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
		return function() --[[ line: 91 ]] end
	end, { var13.isSquadIndicatorEnabled, var19 })
	
	if var13.isSquadIndicatorEnabled then
		if var18 ~= "" then
			contrast = var14.Color.System.Success
		elseif var16 > 0 then
			contrast = var14.Color.System.Contrast
		end
	end
	local var22 = if var13.isSquadIndicatorEnabled then contrast else var16 > 0
	local var23 = useMappedSignal(mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function(_) --[[ line: 104 ]]
		-- upvalues: inExperienceAppChatModalModule (copy)
		return inExperienceAppChatModalModule:getVisible()
	end))
	local var24 = usePartyIconModule(var15, 24, if var23 then on else off)
	local var25 = reactModule.useContext(subMenuContextModule)
	
	local function _(p3) --[[ line: 112 | named "getTransparency" ]]
		-- upvalues: var25 (ref)
		return if var25 then var25:map(function(p4) --[[ line: 114 ]]
			-- upvalues: p3 (ref)
			return p3 + (1 - p3) * (1 - p4)
		end) else p3
	end
	
	local var26 = nil
	
	if fFlagEnableChatIconUnibarDropdownFixEnabled then
		local transparency = var14.Color.Content.Default.Transparency
		var26 = if var25 then var25:map(function(p5) --[[ line: 124 ]]
			-- upvalues: var14 (ref), transparency (ref)
			return {
				Color3 = var14.Color.Content.Default.Color3,
				Transparency = transparency + (1 - transparency) * (1 - p5)
			}
		end) else var14.Color.Content.Default
	end
	local var29
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t_1 = { Size = UDim2.new(0, var15, 0, var15) }
	local t_2 = {}
	
	if argoPartyExperimentation.getIsRenameEnabled() then
		var29 = reactModule.createElement(foundationModule.Icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			name = var11.icon,
			variant = if var23 then foundationModule.Enums.IconVariant.Filled else foundationModule.Enums.IconVariant.Regular,
			style = if fFlagEnableChatIconUnibarDropdownFixEnabled then var26 else nil
		})
	else
		local t_4
		var29 = reactModule.createElement
		local image = foundationModule.Image
		local t_3 = {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = var24.size:map(function(p6) --[[ line: 147 ]]
				return UDim2.fromOffset(p6, p6)
			end)
		}
		
		if var24.image.backgroundColor then
			local var33
			t_4 = { Color3 = var24.image.backgroundColor }
			
			if var25 then
				local var32 = 0
				var33 = var25:map(function(p7) --[[ line: 114 ]]
					-- upvalues: var32 (ref)
					return var32 + (1 - var32) * (1 - p7)
				end)
			else
				var33 = 0
			end
			t_4.Transparency = var33
		else
			t_4 = var14.Color.None
		end
		t_3.backgroundStyle = t_4
		t_3.cornerRadius = UDim.new(0, var14.Radius.Circle)
		t_3.Image = var24.image.thumbnail
		local t_5 = { Color3 = var14.Color.Content.Emphasis.Color3 }
		local transparency = var14.Color.Content.Emphasis.Transparency
		t_5.Transparency = if var25 then var25:map(function(p8) --[[ line: 114 ]]
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * (1 - p8)
		end) else transparency
		t_3.imageStyle = t_5
		var29 = var29(image, t_3)
	end
	local createElement_1
	t_2.Icon = var29
	
	if var22 then
		local t_5
		createElement_1 = reactModule.createElement
		local view_1 = foundationModule.View
		local t_3 = {
			ZIndex = 2,
			Position = UDim2.new(1, -var14.Stroke.Thicker, 0, var14.Stroke.Thicker)
		}
		
		if var13.isSquadIndicatorEnabled then
			t_5 = { Color3 = contrast.Color3 }
			local transparency = contrast.Transparency
			t_5.Transparency = if var25 then var25:map(function(p9) --[[ line: 114 ]]
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * (1 - p9)
			end) else transparency
		else
			t_5 = { Color3 = var14.Color.System.Contrast.Color3 }
			local transparency = var14.Color.System.Contrast.Transparency
			t_5.Transparency = if var25 then var25:map(function(p10) --[[ line: 114 ]]
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * (1 - p10)
			end) else transparency
		end
		t_3.backgroundStyle = t_5
		local t_6 = { Color = var14.Color.Surface.Surface_0.Color3 }
		local transparency = var14.Color.Surface.Surface_0.Transparency
		t_6.Transparency = if var25 then var25:map(function(p11) --[[ line: 114 ]]
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * (1 - p11)
		end) else transparency
		t_6.Thickness = var14.Stroke.Thicker
		t_3.stroke = t_6
		t_3.tag = {
			["anchor-top-right radius-circle size-200"] = true,
			["stroke-thicker"] = not fFlagEnableChatIconUnibarDropdownFixEnabled
		}
		createElement_1 = createElement_1(view_1, t_3)
	else
		createElement_1 = nil
	end
	t_2.Badge = createElement_1
	
	return createElement(view, t_1, t_2)
end