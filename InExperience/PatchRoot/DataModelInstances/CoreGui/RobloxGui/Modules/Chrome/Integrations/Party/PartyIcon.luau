local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local flagsModule = require(chrome.ChromeShared.Flags)
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local useMappedSignal = require(corePackagesService.Workspace.Packages.Chrome).Hooks.useMappedSignal
local usePartyIconModule = require(chrome.Integrations.Party.usePartyIcon)
local mappedSignal = chromeUtilsModule.MappedSignal
local useTokens = foundationModule.Hooks.useTokens
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local subMenuContextModule = require(chrome.ChromeShared.Unibar.SubMenuContext)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local fFlagTokenizeUnibarConstantsWithStyleProvider = flagsModule.FFlagTokenizeUnibarConstantsWithStyleProvider

return function()
	-- upvalues: useTokens (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), mappedSignal (ref), inExperienceAppChatModalModule (ref), useMappedSignal (ref), usePartyIconModule (ref), reactModule (ref), subMenuContextModule (ref), foundationModule (ref)
	local none
	local var10 = useTokens()
	local _ = nil
	local var11 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
	local var12 = usePartyIconModule(var11, 24, if useMappedSignal(mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function(_)
		-- upvalues: inExperienceAppChatModalModule (copy)
		return inExperienceAppChatModalModule:getVisible()
	end)) then "icons/menu/2-person-with-bubble-on" else "icons/menu/2-person-with-bubble")
	local var13 = reactModule.useContext(subMenuContextModule)
	
	local function _(p0)
		-- upvalues: var13 (ref)
		return if var13 then var13:map(function(p1)
			-- upvalues: p0 (ref)
			return p0 + (1 - p0) * (1 - p1)
		end) else p0
	end
	
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = { Size = UDim2.new(0, var11, 0, var11) }
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local image = foundationModule.Image
	local t_2 = {
		tag = "anchor-center-center position-center-center radius-circle",
		Size = var12.size:map(function(p2)
			return UDim2.fromOffset(p2, p2)
		end)
	}
	
	if var12.image.backgroundColor then
		local var18
		none = { Color3 = var12.image.backgroundColor }
		
		if var13 then
			local var17 = 0
			var18 = var13:map(function(p3)
				-- upvalues: var17 (ref)
				return var17 + (1 - var17) * (1 - p3)
			end)
		else
			var18 = 0
		end
		none.Transparency = var18
	else
		none = var10.Color.None
	end
	t_2.backgroundStyle = none
	t_2.Image = var12.image.thumbnail
	local t_3 = { Color3 = var10.Color.Content.Emphasis.Color3 }
	local transparency = var10.Color.Content.Emphasis.Transparency
	t_3.Transparency = if var13 then var13:map(function(p4)
		-- upvalues: transparency (ref)
		return transparency + (1 - transparency) * (1 - p4)
	end) else transparency
	t_2.imageStyle = t_3
	t_1.Icon = createElement_1(image, t_2)
	local createElement_2 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_4 = {
		tag = "anchor-top-right radius-circle size-200 stroke-thicker",
		ZIndex = 2,
		Position = UDim2.new(1, -var10.Stroke.Thicker, 0, var10.Stroke.Thicker)
	}
	local t_5 = { Color3 = var10.Color.System.Success.Color3 }
	local transparency_1 = var10.Color.System.Success.Transparency
	t_5.Transparency = if var13 then var13:map(function(p5)
		-- upvalues: transparency_1 (ref)
		return transparency_1 + (1 - transparency_1) * (1 - p5)
	end) else transparency_1
	t_4.backgroundStyle = t_5
	local t_6 = { Color = var10.Color.Surface.Surface_0.Color3 }
	local transparency_2 = var10.Color.Surface.Surface_0.Transparency
	t_6.Transparency = if var13 then var13:map(function(p6)
		-- upvalues: transparency_2 (ref)
		return transparency_2 + (1 - transparency_2) * (1 - p6)
	end) else transparency_2
	t_6.Thickness = var10.Stroke.Thicker
	t_4.stroke = t_6
	t_1.Badge = createElement_2(view_1, t_4)
	
	return createElement(view, t, t_1)
end