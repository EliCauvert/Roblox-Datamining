local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ScrollBarType = UIBloxModule.App.Container.Enum.ScrollBarType
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local FocusFrameModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.FocusFrame)
local FFlagExperienceDetailsTextUseTokensModule = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)

local function PanelContentWrapper(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), VerticalScrollView (copy), ScrollBarType (copy)
	local UseStyleResult = UseStyleFunction()
	local PanelRadius = UseDesignTokensFunction().LuaApps.ExperienceDetails.PanelRadius
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), p1 (copy)
		if UseRefResult.current then
			for _, Gui in UseRefResult.current:GetDescendants() do
				if Gui:IsA("GuiObject") then
					if Gui == UseRefResult1.current and p1.selectable then
						Gui.Selectable = true
					else
						Gui.Selectable = false
					end
				end
			end
		end
	end)
	
	return ReactModule.createElement(if p1.useCanvasGroup then "CanvasGroup" else "Frame", {
		SelectionGroup = true,
		ref = UseRefResult,
		Position = UDim2.new(),
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundUIContrast.Transparency,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, PanelRadius) }),
		ScrollView = ReactModule.createElement(VerticalScrollView, {
			useAutomaticCanvasSize = true,
			ref = UseRefResult1,
			canvasSizeY = UDim.new(),
			scrollingEnabled = p1.scrollingEnabled,
			scrollBarType = if p1.scrollingEnabled then ScrollBarType.Gamepad else nil
		}, p1.children)
	})
end

return ReactModule.forwardRef(function(p2, Ref)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), StyledTextLabel (copy), FFlagExperienceDetailsTextUseTokensModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), PanelContentWrapper (copy), UseCursorFunction (copy), FocusFrameModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local SafeAreaSize = UseDesignTokensResult.LuaApps.ExperienceDetails.SafeAreaSize or Vector2.zero
	local PanelHeaderMargin = UseDesignTokensResult.LuaApps.ExperienceDetails.PanelHeaderMargin or 0
	
	return ReactModule.createElement(FocusFrameModule, {
		limitInlineHeight = true,
		ref = Ref,
		layoutOrder = p2.layoutOrder,
		safeAreaSize = UDim2.new(1, -2 * SafeAreaSize.X, 1, -2 * SafeAreaSize.Y),
		renderHeader = ReactModule.useCallback(function(_)
			-- upvalues: ReactModule (upval), StyledTextLabel (upval), p2 (copy), UseStyleResult (copy), FFlagExperienceDetailsTextUseTokensModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy), PanelHeaderMargin (copy)
			return {
				ReactModule.createElement(StyledTextLabel, {
					text = p2.title,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					fontStyle = if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall else UseDesignTokensResult.Semantic.Typography.Header else UseStyleResult.Font.Header1
				}),
				ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, PanelHeaderMargin) })
			}
		end, { p2.title, UseStyleResult }),
		renderContents = ReactModule.useCallback(function(_)
			-- upvalues: ReactModule (upval), p2 (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(),
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, p2.children)
		end, { p2.children }),
		renderContentWrapper = ReactModule.useCallback(function(ScrollingEnabled, Selectable, p3)
			-- upvalues: p2 (copy), ReactModule (upval), PanelContentWrapper (upval)
			if p2.onFocusChanged then
				p2.onFocusChanged(Selectable)
			end
			return ReactModule.createElement(PanelContentWrapper, {
				scrollingEnabled = ScrollingEnabled,
				selectable = Selectable,
				useCanvasGroup = p2.roundContentCorners or false
			}, p3)
		end, { p2.roundContentCorners, p2.onFocusChanged }),
		selectionCursor = UseCursorFunction(UDim.new(0, UseDesignTokensResult.LuaApps.ExperienceDetails.PanelRadius))
	})
end)