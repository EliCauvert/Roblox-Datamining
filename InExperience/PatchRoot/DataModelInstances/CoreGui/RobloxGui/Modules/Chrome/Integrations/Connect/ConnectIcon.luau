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
local var1 = getAppChatNavbarItemConfigModule()
local off = var1.icon.off
local on = var1.icon.on
local t = {
	integrationId = "",
	shouldShowCustomBadge = true,
	isSquadIndicatorEnabled = false
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), inExperienceAppChatModalModule (ref), mappedSignal (ref), useMappedSignal (ref), usePartyIconModule (ref), on (ref), off (ref), subMenuContextModule (ref), fFlagEnableChatIconUnibarDropdownFixEnabled (ref), foundationModule (ref), argoPartyExperimentation (ref), var1 (ref)
	local var2 = cryoModule.Dictionary.union(t, p1)
	local var3 = useTokens()
	local _ = nil
	local var4 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
	local var5, var6 = reactModule.useState(inExperienceAppChatModalModule.default.unreadCount)
	
	if var2.shouldShowCustomBadge then
		reactModule.useEffect(function()
			-- upvalues: inExperienceAppChatModalModule (copy), var6 (ref)
			local eventConnection = inExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p2)
				-- upvalues: var6 (copy)
				var6(p2)
			end)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end, { var6 })
	else
		var5 = 0
	end
	local var7 = nil
	local var8 = nil
	local contrast = nil
	
	if var2.isSquadIndicatorEnabled then
		local var9, var10 = reactModule.useState(inExperienceAppChatModalModule.default.currentSquadId)
		var7 = var9
		var8 = var10
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), inExperienceAppChatModalModule (copy), var8 (write)
		if var2.isSquadIndicatorEnabled then
			local eventConnection = inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p2)
				-- upvalues: var8 (copy)
				var8(p2)
			end)
			
			return function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
		return function() end
	end, { var2.isSquadIndicatorEnabled, var8 })
	
	if var2.isSquadIndicatorEnabled then
		if var7 ~= "" then
			contrast = var3.Color.System.Success
		elseif var5 > 0 then
			contrast = var3.Color.System.Contrast
		end
	end
	local var11 = if var2.isSquadIndicatorEnabled then contrast else var5 > 0
	local var12 = useMappedSignal(mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function(_)
		-- upvalues: inExperienceAppChatModalModule (copy)
		return inExperienceAppChatModalModule:getVisible()
	end))
	local var13 = usePartyIconModule(var4, 24, if var12 then on else off)
	local var14 = reactModule.useContext(subMenuContextModule)
	
	local function _(p2)
		-- upvalues: var14 (ref)
		return if var14 then var14:map(function(p3)
			-- upvalues: p2 (ref)
			return p2 + (1 - p2) * (1 - p3)
		end) else p2
	end
	
	local var15 = nil
	
	if fFlagEnableChatIconUnibarDropdownFixEnabled then
		local transparency = var3.Color.Content.Default.Transparency
		var15 = if var14 then var14:map(function(p2)
			-- upvalues: var3 (ref), transparency (ref)
			return {
				Color3 = var3.Color.Content.Default.Color3,
				Transparency = transparency + (1 - transparency) * (1 - p2)
			}
		end) else var3.Color.Content.Default
	end
	local var16
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t_1 = { Size = UDim2.new(0, var4, 0, var4) }
	local t_2 = {}
	
	if argoPartyExperimentation.getIsRenameEnabled() then
		var16 = reactModule.createElement(foundationModule.Icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			name = var1.icon,
			variant = if var12 then foundationModule.Enums.IconVariant.Filled else foundationModule.Enums.IconVariant.Regular,
			style = if fFlagEnableChatIconUnibarDropdownFixEnabled then var15 else nil
		})
	else
		local t_4
		var16 = reactModule.createElement
		local image = foundationModule.Image
		local t_3 = {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = var13.size:map(function(p2)
				return UDim2.fromOffset(p2, p2)
			end)
		}
		
		if var13.image.backgroundColor then
			local var17
			t_4 = { Color3 = var13.image.backgroundColor }
			
			if var14 then
				local var18 = 0
				var17 = var14:map(function(p2)
					-- upvalues: var18 (ref)
					return var18 + (1 - var18) * (1 - p2)
				end)
			else
				var17 = 0
			end
			t_4.Transparency = var17
		else
			t_4 = var3.Color.None
		end
		t_3.backgroundStyle = t_4
		t_3.cornerRadius = UDim.new(0, var3.Radius.Circle)
		t_3.Image = var13.image.thumbnail
		local t_5 = { Color3 = var3.Color.Content.Emphasis.Color3 }
		local transparency = var3.Color.Content.Emphasis.Transparency
		t_5.Transparency = if var14 then var14:map(function(p2)
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * (1 - p2)
		end) else transparency
		t_3.imageStyle = t_5
		var16 = var16(image, t_3)
	end
	local createElement_1
	t_2.Icon = var16
	
	if var11 then
		local t_5
		createElement_1 = reactModule.createElement
		local view_1 = foundationModule.View
		local t_3 = {
			ZIndex = 2,
			Position = UDim2.new(1, -var3.Stroke.Thicker, 0, var3.Stroke.Thicker)
		}
		
		if var2.isSquadIndicatorEnabled then
			t_5 = { Color3 = contrast.Color3 }
			local transparency = contrast.Transparency
			t_5.Transparency = if var14 then var14:map(function(p2)
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * (1 - p2)
			end) else transparency
		else
			t_5 = { Color3 = var3.Color.System.Contrast.Color3 }
			local transparency = var3.Color.System.Contrast.Transparency
			t_5.Transparency = if var14 then var14:map(function(p2)
				-- upvalues: transparency (ref)
				return transparency + (1 - transparency) * (1 - p2)
			end) else transparency
		end
		t_3.backgroundStyle = t_5
		local t_6 = { Color = var3.Color.Surface.Surface_0.Color3 }
		local transparency = var3.Color.Surface.Surface_0.Transparency
		t_6.Transparency = if var14 then var14:map(function(p2)
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * (1 - p2)
		end) else transparency
		t_6.Thickness = var3.Stroke.Thicker
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