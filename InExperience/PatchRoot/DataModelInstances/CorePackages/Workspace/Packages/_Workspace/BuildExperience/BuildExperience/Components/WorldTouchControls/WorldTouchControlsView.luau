local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

local function _(p1, p2, p3)
	local P2 = p3 or 0
	
	return p1:map(function(p4)
		-- upvalues: p2 (copy), P2 (copy)
		return { Color3 = p2, Transparency = 1 - (1 - P2) * p4 }
	end)
end

local _ = function()
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
end

local function renderPressArea(OnStickInputBegan)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[ReactModule.Event.InputBegan] = OnStickInputBegan
	})
end

local function renderHoldButton(UseTokensResult, Opacity, Name, Position, OnLowerInputBegan, TestId)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), renderPressArea (copy)
	local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	local v1 = 0.35
	local config = {
		tag = "anchor-bottom-right",
		Position = Position,
		Size = UDim2.fromOffset(56, 56),
		backgroundStyle = Opacity:map(function(p1)
			-- upvalues: SurfaceColor3 (copy), v1 (copy)
			return {
				Color3 = SurfaceColor3,
				Transparency = 1 - (1 - v1) * p1
			}
		end),
		testId = TestId
	}
	local EmphasisColor3 = UseTokensResult.Color.Content.Emphasis.Color3
	local Transparency = UseTokensResult.Color.Content.Emphasis.Transparency or 0
	
	return ReactModule.createElement(View, config, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Icon = ReactModule.createElement(Icon, {
			name = Name,
			size = IconSize.Medium,
			style = Opacity:map(function(p1)
				-- upvalues: EmphasisColor3 (copy), Transparency (copy)
				return {
					Color3 = EmphasisColor3,
					Transparency = 1 - (1 - Transparency) * p1
				}
			end),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}),
		PressArea = renderPressArea(OnLowerInputBegan)
	})
end

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), View (copy), renderPressArea (copy), renderHoldButton (copy), IconName (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Area = p1.area
	
	if p1.isVisible and Area ~= nil and Area.Width > 0 and Area.Height > 0 then
		local ScaledStickRadius = p1.stickRadius * 2
		local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
		local v1 = 0.5
		local config = {
			tag = "anchor-bottom-left",
			testId = "WorldTouchControls.Stick",
			Position = UDim2.new(0, 24, 1, -24),
			Size = UDim2.fromOffset(ScaledStickRadius, ScaledStickRadius),
			backgroundStyle = p1.opacity:map(function(p2)
				-- upvalues: SurfaceColor3 (copy), v1 (copy)
				return {
					Color3 = SurfaceColor3,
					Transparency = 1 - (1 - v1) * p2
				}
			end)
		}
		local EmphasisColor3 = UseTokensResult.Color.Content.Emphasis.Color3
		local v2 = 0.15
		
		return ReactModule.createElement(View, {
			testId = "WorldTouchControls",
			Position = UDim2.fromOffset(Area.Min.X, Area.Min.Y),
			Size = UDim2.fromOffset(Area.Width, Area.Height)
		}, {
			Stick = ReactModule.createElement(View, config, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				Knob = ReactModule.createElement(View, {
					tag = "anchor-center-center",
					testId = "WorldTouchControls.Knob",
					Position = p1.knobOffset:map(function(Vector): UDim2
						return UDim2.new(0.5, Vector.X, 0.5, Vector.Y)
					end),
					Size = UDim2.fromOffset(48, 48),
					backgroundStyle = p1.opacity:map(function(p2)
						-- upvalues: EmphasisColor3 (copy), v2 (copy)
						return {
							Color3 = EmphasisColor3,
							Transparency = 1 - (1 - v2) * p2
						}
					end)
				}, {
					Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
				}),
				PressArea = renderPressArea(p1.onStickInputBegan)
			}),
			Raise = renderHoldButton(UseTokensResult, p1.opacity, IconName.ChevronLargeUp, UDim2.new(1, -24, 1, -92), p1.onRaiseInputBegan, "WorldTouchControls.Raise"),
			Lower = renderHoldButton(UseTokensResult, p1.opacity, IconName.ChevronLargeDown, UDim2.new(1, -24, 1, -24), p1.onLowerInputBegan, "WorldTouchControls.Lower")
		})
	else
		return nil
	end
end