local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AvatarModule = require(Foundation.Components.Avatar)
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local _ = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Components.Types)
local UserPresenceModule = require(Foundation.Enums.UserPresence)
local ViewModule = require(Foundation.Components.View)
local GetStateLayerStyleModule = require(Foundation.Components.Interactable.getStateLayerStyle)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), UserPresenceModule (copy), ViewModule (copy), AvatarModule (copy), AvatarSizeModule (copy), GetStateLayerStyleModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Size2400 = UseTokensModuleResult.Size.Size_2400
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(1)
	local NewThicker = if p1.userPresence == UserPresenceModule.InExperience then UseTokensModuleResult.Stroke.Thicker + UseTokensModuleResult.Stroke.Standard else 0
	local XOffset = Size2400 + NewThicker * 2
	
	return ReactModule.createElement(ViewModule, {
		Size = UDim2.fromScale(1, 1),
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize.X)
		end, {})
	}, {
		Reference = ReactModule.createElement(ViewModule, {
			Size = UDim2.fromOffset(100, 0),
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame: Frame)
				-- upvalues: UseBindingResult2_1 (copy)
				if Frame.AbsoluteSize.X > 0 then
					UseBindingResult2_1(Frame.AbsoluteSize.X / 100)
				end
			end, {})
		}),
		AvatarContainer = ReactModule.createElement(ViewModule, {
			Size = UDim2.fromOffset(XOffset, XOffset),
			padding = UDim.new(0, NewThicker)
		}, {
			Scale = ReactModule.createElement("UIScale", {
				Scale = ReactModule.useMemo(function()
					-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy)
					return ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(function(Entry)
						return Entry[1] / Entry[2]
					end)
				end, {}):map(function(p2)
					-- upvalues: XOffset (copy)
					return p2 / XOffset
				end)
			}),
			Avatar = ReactModule.createElement(AvatarModule, {
				userId = p1.userId,
				userPresence = p1.userPresence,
				includeProfileFrame = p1.includeProfileFrame,
				size = AvatarSizeModule.Pictogram,
				backgroundStyle = p1.backgroundStyle or UseTokensModuleResult.Color.Shift.Shift_200,
				testId = `{p1.testId}--avatar`
			})
		}),
		StateLayer = if p1.controlState then ReactModule.createElement(ViewModule, {
			tag = "size-full-full radius-circle",
			ZIndex = 2,
			backgroundStyle = p1.controlState:map(function(p2)
				-- upvalues: GetStateLayerStyleModule (upval), UseTokensModuleResult (copy)
				return GetStateLayerStyleModule(UseTokensModuleResult, nil, p2)
			end),
			testId = `{p1.testId}--state-layer`
		}) else nil
	})
end)