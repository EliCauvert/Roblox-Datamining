local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local UseMappedSignalFunction = require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal
local UsePartyIconModule = require(Chrome.Integrations.Party.usePartyIcon)
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local SubMenuContextModule = require(Chrome.ChromeShared.Unibar.SubMenuContext)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local ArgoPartyExperimentation = require(CorePackages.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local v1 = require(CorePackages.Workspace.Packages.AppChat.getAppChatNavbarItemConfig)()
local Off = v1.icon.off
local On = v1.icon.on
local config = {
	integrationId = "",
	shouldShowCustomBadge = true,
	isSquadIndicatorEnabled = false
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), InExperienceAppChatModalModule (copy), MappedSignal (copy), UseMappedSignalFunction (copy), UsePartyIconModule (copy), On (copy), Off (copy), SubMenuContextModule (copy), FoundationModule (copy), ArgoPartyExperimentation (copy), v1 (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = UseTokensFunction()
	local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule.ICON_SIZE
	local UseStateResult, UseStateResult2 = ReactModule.useState(InExperienceAppChatModalModule.default.unreadCount)
	
	if UnionResult.shouldShowCustomBadge then
		ReactModule.useEffect(function()
			-- upvalues: InExperienceAppChatModalModule (upval), UseStateResult2 (copy)
			local EventConnection = InExperienceAppChatModalModule.default.unreadCountSignal.Event:Connect(function(p2)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(p2)
			end)
			
			return function()
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end, { UseStateResult2 })
	else
		UseStateResult = 0
	end
	local v2 = nil
	local Callback = nil
	local Contrast = nil
	
	if UnionResult.isSquadIndicatorEnabled then
		v2, Callback = ReactModule.useState(InExperienceAppChatModalModule.default.currentSquadId)
	end
	ReactModule.useEffect(function()
		-- upvalues: UnionResult (copy), InExperienceAppChatModalModule (upval), Callback (ref)
		if UnionResult.isSquadIndicatorEnabled then
			local EventConnection = InExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p2)
				-- upvalues: Callback (upval)
				Callback(p2)
			end)
			
			return function()
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		else
			return function() end
		end
	end, { UnionResult.isSquadIndicatorEnabled, Callback })
	
	if UnionResult.isSquadIndicatorEnabled then
		if v2 == "" then
			if UseStateResult > 0 then
				Contrast = UseTokensResult.Color.System.Contrast
			end
		else
			Contrast = UseTokensResult.Color.System.Success
		end
	end
	local Contrast1 = if UnionResult.isSquadIndicatorEnabled then Contrast else UseStateResult > 0
	local UseMappedSignalResult = UseMappedSignalFunction((MappedSignal.new(InExperienceAppChatModalModule.default.visibilitySignal.Event, function(_)
		-- upvalues: InExperienceAppChatModalModule (upval)
		return InExperienceAppChatModalModule:getVisible()
	end)))
	local UsePartyIconModuleResult = UsePartyIconModule(ICONSIZE, 24, if UseMappedSignalResult then On else Off)
	local UseContextResult = ReactModule.useContext(SubMenuContextModule)
	
	local function _(p2)
		-- upvalues: UseContextResult (copy)
		return if UseContextResult then UseContextResult:map(function(p3: number): number
			-- upvalues: p2 (copy)
			return p2 + (1 - p2) * (1 - p3)
		end) else p2
	end
	
	local CreateElementFunction2 = ReactModule.createElement
	local View = FoundationModule.View
	local config1 = { Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE) }
	local t = {}
	local Element = nil
	
	if ArgoPartyExperimentation.getIsRenameEnabled() then
		Element = ReactModule.createElement(FoundationModule.Icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			name = v1.icon,
			variant = if UseMappedSignalResult then FoundationModule.Enums.IconVariant.Filled else FoundationModule.Enums.IconVariant.Regular
		})
	else
		local CreateElementFunction1 = ReactModule.createElement
		local Image = FoundationModule.Image
		local config2 = {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UsePartyIconModuleResult.size:map(function(XOffset): UDim2
				return UDim2.fromOffset(XOffset, XOffset)
			end)
		}
		local None = nil
		
		if UsePartyIconModuleResult.image.backgroundColor then
			None = { Color3 = UsePartyIconModuleResult.image.backgroundColor }
			local MapResult = nil
			
			if UseContextResult then
				local v3 = 0
				MapResult = UseContextResult:map(function(p2: number): number
					-- upvalues: v3 (copy)
					return v3 + (1 - v3) * (1 - p2)
				end)
			else
				MapResult = 0
			end
			None.Transparency = MapResult
		else
			None = UseTokensResult.Color.None
		end
		config2.backgroundStyle = None
		config2.cornerRadius = UDim.new(0, UseTokensResult.Radius.Circle)
		config2.Image = UsePartyIconModuleResult.image.thumbnail
		local Transparency2 = UseTokensResult.Color.Content.Emphasis.Transparency
		config2.imageStyle = {
			Color3 = UseTokensResult.Color.Content.Emphasis.Color3,
			Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
				-- upvalues: Transparency2 (copy)
				return Transparency2 + (1 - Transparency2) * (1 - p2)
			end) else Transparency2
		}
		Element = CreateElementFunction1(Image, config2)
	end
	t.Icon = Element
	local Element1 = nil
	
	if Contrast1 then
		local CreateElementFunction = ReactModule.createElement
		local View1 = FoundationModule.View
		local config3 = {
			tag = "anchor-top-right radius-circle size-200 stroke-thicker",
			ZIndex = 2,
			Position = UDim2.new(1, -UseTokensResult.Stroke.Thicker, 0, UseTokensResult.Stroke.Thicker)
		}
		local BackgroundStyle = nil
		
		if UnionResult.isSquadIndicatorEnabled then
			local Transparency3 = Contrast.Transparency
			BackgroundStyle = {
				Color3 = Contrast.Color3,
				Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
					-- upvalues: Transparency3 (copy)
					return Transparency3 + (1 - Transparency3) * (1 - p2)
				end) else Transparency3
			}
		else
			local Transparency = UseTokensResult.Color.System.Contrast.Transparency
			BackgroundStyle = {
				Color3 = UseTokensResult.Color.System.Contrast.Color3,
				Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
					-- upvalues: Transparency (copy)
					return Transparency + (1 - Transparency) * (1 - p2)
				end) else Transparency
			}
		end
		config3.backgroundStyle = BackgroundStyle
		local Transparency1 = UseTokensResult.Color.Surface.Surface_0.Transparency
		config3.stroke = {
			Color = UseTokensResult.Color.Surface.Surface_0.Color3,
			Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
				-- upvalues: Transparency1 (copy)
				return Transparency1 + (1 - Transparency1) * (1 - p2)
			end) else Transparency1,
			Thickness = UseTokensResult.Stroke.Thicker
		}
		Element1 = CreateElementFunction(View1, config3)
	else
		Element1 = nil
	end
	t.Badge = Element1
	
	return CreateElementFunction2(View, config1, t)
end