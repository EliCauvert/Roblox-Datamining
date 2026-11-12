local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle

local function _(OnActivated, _, _)
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	return function()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 30, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/navigation/pushBack"],
				onActivated = OnActivated
			})
		})
	end
end

local _ = function(Text)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return function()
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		return WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Text (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			local CurrentCamera = game.Workspace.CurrentCamera
			local Theme = p1.Theme
			local _Font = p1.Font
			
			return ReactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text,
				Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.TitleLarge.Font) else nil,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(0, if CurrentCamera == nil then 300 else CurrentCamera.ViewportSize.X - 150, 1, 0)
			})
		end)
	end
end

local _ = function(_, OnActivated, OnActivated1, p1, p2)
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	return function()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), p1 (copy), OnActivated (copy), p2 (copy), OnActivated1 (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 60, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			UndoButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/undo"],
				isDisabled = not p1,
				onActivated = OnActivated
			}),
			RedoButton = ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/redo"],
				isDisabled = not p2,
				onActivated = OnActivated1
			})
		})
	end
end

return {
	PortraitModeHeader = function(p1)
		-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), WithStyleFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
		local CreateElementFunction1 = ReactModule.createElement
		local v1 = "Frame"
		local config = {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			LayoutOrder = 1,
			ZIndex = 2,
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 0, 72)
		}
		local t = {}
		local CreateElementFunction = ReactModule.createElement
		local BackAction = p1.backAction
		local _ = p1.isRedoEnabled
		local _ = p1.isUndoEnabled
		local config1 = {
			backgroundTransparency = 1,
			barHeight = 72,
			margin = 12,
			isSecondary = true,
			renderLeft = function()
				-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), BackAction (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 30, 1, 0)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					BackButton = ReactModule.createElement(IconButton, {
						layoutOrder = 1,
						iconSize = IconSize.Medium,
						icon = Images["icons/navigation/pushBack"],
						onActivated = BackAction
					})
				})
			end
		}
		
		if p1.isRedoEnabled or p1.isUndoEnabled then
			local _ = p1.annotationPoints
			local UndoAnnotationPoints = p1.undoAnnotationPoints
			local RedoAnnotationPoints = p1.redoAnnotationPoints
			local IsUndoEnabled = p1.isUndoEnabled
			local IsRedoEnabled = p1.isRedoEnabled
			
			local function RenderRight()
				-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), IsUndoEnabled (copy), UndoAnnotationPoints (copy), IsRedoEnabled (copy), RedoAnnotationPoints (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 60, 1, 0)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					UndoButton = ReactModule.createElement(IconButton, {
						layoutOrder = 1,
						iconSize = IconSize.Medium,
						icon = Images["icons/actions/edit/undo"],
						isDisabled = not IsUndoEnabled,
						onActivated = UndoAnnotationPoints
					}),
					RedoButton = ReactModule.createElement(IconButton, {
						layoutOrder = 2,
						iconSize = IconSize.Medium,
						icon = Images["icons/actions/edit/redo"],
						isDisabled = not IsRedoEnabled,
						onActivated = RedoAnnotationPoints
					})
				})
			end
		else
			local function RenderRight() end
		end
		config1.renderRight = RenderRight
		local TitleText = p1.titleText
		
		function config1.renderCenter()
			-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			return WithStyleFunction(function(p2)
				-- upvalues: ReactModule (upval), TitleText (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
				local CurrentCamera = game.Workspace.CurrentCamera
				local Theme = p2.Theme
				local _Font = p2.Font
				
				return ReactModule.createElement("TextLabel", {
					TextSize = 20,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = TitleText,
					Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Size = UDim2.new(0, if CurrentCamera == nil then 300 else CurrentCamera.ViewportSize.X - 150, 1, 0)
				})
			end)
		end
		
		t.Bar = CreateElementFunction(HeaderBar, config1)
		
		return CreateElementFunction1(v1, config, t)
	end,
	PortraitModeFooter = function(p1)
		-- upvalues: ReactModule (copy), ButtonStack (copy), ButtonType (copy)
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, 60),
			BackgroundColor3 = Color3.fromHex("#000000"),
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Container = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 400, 1, 0)
			}, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 32),
					PaddingRight = UDim.new(0, 32)
				}),
				ActionButtons = ReactModule.createElement(ButtonStack, {
					marginBetween = 8,
					buttons = {
						{
							buttonType = ButtonType.PrimarySystem,
							props = { onActivated = p1.nextAction, text = p1.nextText }
						}
					}
				})
			})
		})
	end
}