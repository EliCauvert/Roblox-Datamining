local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local UseMappedSignalFunction = require(CorePackages.Workspace.Packages.Chrome).Hooks.useMappedSignal
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local SubMenuContextModule = require(Chrome.ChromeShared.Unibar.SubMenuContext)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local FFlagEnableChatIconUnibarDropdownFixEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableChatIconUnibarDropdownFixEnabled
local v1 = require(CorePackages.Workspace.Packages.AppChat.getAppChatNavbarItemConfig)()
local config = {
	integrationId = "",
	shouldShowCustomBadge = true,
	isSquadIndicatorEnabled = false
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), InExperienceAppChatModalModule (copy), MappedSignal (copy), UseMappedSignalFunction (copy), SubMenuContextModule (copy), FFlagEnableChatIconUnibarDropdownFixEnabled (copy), FoundationModule (copy), v1 (copy)
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
	local UseContextResult = ReactModule.useContext(SubMenuContextModule)
	
	local function _(p2)
		-- upvalues: UseContextResult (copy)
		return if UseContextResult then UseContextResult:map(function(p3: number): number
			-- upvalues: p2 (copy)
			return p2 + (1 - p2) * (1 - p3)
		end) else p2
	end
	
	local MapResult = nil
	
	if FFlagEnableChatIconUnibarDropdownFixEnabled then
		local Transparency2 = UseTokensResult.Color.Content.Default.Transparency
		MapResult = if UseContextResult then UseContextResult:map(function(p2: number)
			-- upvalues: UseTokensResult (copy), Transparency2 (copy)
			return {
				Color3 = UseTokensResult.Color.Content.Default.Color3,
				Transparency = Transparency2 + (1 - Transparency2) * (1 - p2)
			}
		end) else UseTokensResult.Color.Content.Default
	end
	local CreateElementFunction = ReactModule.createElement
	local View = FoundationModule.View
	local config1 = { Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE) }
	local config2 = {
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			name = v1.icon,
			variant = if UseMappedSignalResult then FoundationModule.Enums.IconVariant.Filled else FoundationModule.Enums.IconVariant.Regular,
			style = if FFlagEnableChatIconUnibarDropdownFixEnabled then MapResult else nil
		})
	}
	local Badge = nil
	
	if Contrast1 then
		local CreateElementFunction1 = ReactModule.createElement
		local View1 = FoundationModule.View
		local config3 = {
			ZIndex = 2,
			Position = UDim2.new(1, -UseTokensResult.Stroke.Thicker, 0, UseTokensResult.Stroke.Thicker)
		}
		local BackgroundStyle = nil
		
		if UnionResult.isSquadIndicatorEnabled then
			local Transparency = Contrast.Transparency
			BackgroundStyle = {
				Color3 = Contrast.Color3,
				Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
					-- upvalues: Transparency (copy)
					return Transparency + (1 - Transparency) * (1 - p2)
				end) else Transparency
			}
		else
			local Transparency1 = UseTokensResult.Color.System.Contrast.Transparency
			BackgroundStyle = {
				Color3 = UseTokensResult.Color.System.Contrast.Color3,
				Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
					-- upvalues: Transparency1 (copy)
					return Transparency1 + (1 - Transparency1) * (1 - p2)
				end) else Transparency1
			}
		end
		config3.backgroundStyle = BackgroundStyle
		local Transparency3 = UseTokensResult.Color.Surface.Surface_0.Transparency
		config3.stroke = {
			Color = UseTokensResult.Color.Surface.Surface_0.Color3,
			Transparency = if UseContextResult then UseContextResult:map(function(p2: number): number
				-- upvalues: Transparency3 (copy)
				return Transparency3 + (1 - Transparency3) * (1 - p2)
			end) else Transparency3,
			Thickness = UseTokensResult.Stroke.Thicker
		}
		config3.tag = {
			["anchor-top-right radius-circle size-200"] = true,
			["stroke-thicker"] = not FFlagEnableChatIconUnibarDropdownFixEnabled
		}
		Badge = CreateElementFunction1(View1, config3)
	else
		Badge = nil
	end
	config2.Badge = Badge
	
	return CreateElementFunction(View, config1, config2)
end