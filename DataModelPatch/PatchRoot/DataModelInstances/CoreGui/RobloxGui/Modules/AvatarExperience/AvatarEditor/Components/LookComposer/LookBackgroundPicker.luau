local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UpdateLookDetailsModule = require(Modules.AvatarExperience.Common.Actions.UpdateLookDetails)
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Items = {
	Color3.fromHex("#584D43"), Color3.fromHex("#775D49"),
	Color3.fromHex("#AB9585"), Color3.fromHex("#C3916F"),
	Color3.fromHex("#E2BA97"), Color3.fromHex("#534338"),
	Color3.fromHex("#63422C"), Color3.fromHex("#B79C66"),
	Color3.fromHex("#C2AD7F"), Color3.fromHex("#D4C69F"),
	Color3.fromHex("#917A78"), Color3.fromHex("#98504E"),
	Color3.fromHex("#CE8A7D"), Color3.fromHex("#F7CBCA"),
	Color3.fromHex("#F19DD9"), Color3.fromHex("#77859B"),
	Color3.fromHex("#5B7BAA"), Color3.fromHex("#8DB9D9"),
	Color3.fromHex("#AFA7F9"), Color3.fromHex("#9D6298"),
	Color3.fromHex("#3E8D9A"), Color3.fromHex("#6A9855"),
	Color3.fromHex("#829B70"), Color3.fromHex("#A8C391"),
	Color3.fromHex("#D89E52"), Color3.fromHex("#EFCE53"),
	Color3.fromHex("#F3DA7D"), Color3.fromHex("#625F62"),
	Color3.fromHex("#CDCDCD"), Color3.fromHex("#F8F8F8")
}

return function()
	-- upvalues: UseDispatchFunction (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), CryoModule (copy), UpdateLookDetailsModule (copy), Focusable (copy), FFlagRenameDeprecatedUIBloxTokens (copy), DefaultMetricsGridView (copy), GridMetrics (copy), Items (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1.AvatarExperience.AvatarScene.Looks[ConstantsModule.DraftLookId]
	end)
	
	return ReactModule.createElement(Focusable.Frame, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Header = ReactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			Text = "Select a background",
			TextWrapped = true,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			Font = UseStyleResult.Font.Header2.Font,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
			})
		}),
		ScrollingFrame = ReactModule.createElement(Focusable.ScrollingFrame, {
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			Position = UDim2.fromOffset(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1200 else UseDesignTokensResult.Global.Size_600),
			Size = UDim2.fromScale(1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Container = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150),
					PaddingBottom = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150),
					PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150),
					PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_300 else UseDesignTokensResult.Global.Size_150)
				}),
				BackgroundColorsGrid = ReactModule.createElement(DefaultMetricsGridView, {
					maxHeight = 1e999,
					defaultChildIndex = 1,
					renderItem = ReactModule.useCallback(function(BackgroundColor3)
						-- upvalues: ReactModule (upval), UseSelectorResult (copy), CryoModule (upval), UseDispatchResult (copy), UpdateLookDetailsModule (upval), ConstantsModule (upval)
						return ReactModule.createElement("TextButton", {
							Size = UDim2.fromScale(1, 1),
							BackgroundColor3 = BackgroundColor3,
							Text = "",
							[ReactModule.Event.Activated] = function()
								-- upvalues: BackgroundColor3 (copy), UseSelectorResult (upval), CryoModule (upval), UseDispatchResult (upval), UpdateLookDetailsModule (upval), ConstantsModule (upval)
								UseDispatchResult(UpdateLookDetailsModule(ConstantsModule.DraftLookId, {
									displayProperties = CryoModule.Dictionary.join(if UseSelectorResult then UseSelectorResult.displayProperties else {}, {
										backgroundType = "Hex",
										backgroundValue = BackgroundColor3:ToHex()
									})
								}))
							end
						}, {
							UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
						})
					end, { UseSelectorResult, UseDispatchResult }),
					getItemHeight = function(p1)
						return p1
					end,
					getItemMetrics = GridMetrics.makeCustomMetricsGetter({ minimumItemsPerRow = 5, minimumItemWidth = 60 }),
					itemPadding = Vector2.new(if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Size_125, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_250 else UseDesignTokensResult.Global.Size_125),
					items = Items
				})
			})
		})
	})
end