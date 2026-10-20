local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle

local function _(Text)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy)
	return function()
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy)
		return WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Text (upval)
			local Theme = p1.Theme
			
			return ReactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text,
				Font = p1.Font.Header2.Font,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
end

local _ = function(OnActivated, OnActivated1, OnActivated2, p1, p2)
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	local P5 = p1 or p2
	
	return function()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy), P5 (copy), p2 (copy), OnActivated1 (copy), p1 (copy), OnActivated2 (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
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
			}),
			UndoButton = P5 and ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/undo"],
				isDisabled = not p2,
				onActivated = OnActivated1
			}),
			RedoButton = P5 and ReactModule.createElement(IconButton, {
				layoutOrder = 3,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/redo"],
				isDisabled = not p1,
				onActivated = OnActivated2
			})
		})
	end
end

local _ = function(OnActivated, _, Text)
	-- upvalues: ReactModule (copy), ButtonStack (copy), ButtonType (copy)
	return function()
		-- upvalues: ReactModule (upval), ButtonStack (upval), ButtonType (upval), OnActivated (copy), Text (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Buttons = ReactModule.createElement(ButtonStack, {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = OnActivated, text = Text }
					}
				}
			})
		})
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), ButtonStack (copy), ButtonType (copy), WithStyleFunction (copy)
	local BackAction = p1.backAction
	local UndoAnnotationPoints = p1.undoAnnotationPoints
	local RedoAnnotationPoints = p1.redoAnnotationPoints
	local IsRedoEnabled = p1.isRedoEnabled
	local IsUndoEnabled = p1.isUndoEnabled
	local IsRedoEnabled1 = IsRedoEnabled or IsUndoEnabled
	
	local function RenderLeft()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), BackAction (copy), IsRedoEnabled1 (copy), IsUndoEnabled (copy), UndoAnnotationPoints (copy), IsRedoEnabled (copy), RedoAnnotationPoints (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
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
			}),
			UndoButton = IsRedoEnabled1 and ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/undo"],
				isDisabled = not IsUndoEnabled,
				onActivated = UndoAnnotationPoints
			}),
			RedoButton = IsRedoEnabled1 and ReactModule.createElement(IconButton, {
				layoutOrder = 3,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/redo"],
				isDisabled = not IsRedoEnabled,
				onActivated = RedoAnnotationPoints
			})
		})
	end
	
	local NextAction = p1.nextAction
	local _ = p1.annotationPoints
	local NextText = p1.nextText
	
	local function RenderRight()
		-- upvalues: ReactModule (upval), ButtonStack (upval), ButtonType (upval), NextAction (copy), NextText (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Buttons = ReactModule.createElement(ButtonStack, {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = { onActivated = NextAction, text = NextText }
					}
				}
			})
		})
	end
	
	local TitleText = p1.titleText
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 0.1,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#000000"),
		Size = UDim2.new(1, 0, 0, 71)
	}, {
		Bar = ReactModule.createElement(HeaderBar, {
			backgroundTransparency = 1,
			barHeight = 72,
			renderLeft = RenderLeft,
			renderRight = RenderRight,
			renderCenter = function()
				-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy)
				return WithStyleFunction(function(p2)
					-- upvalues: ReactModule (upval), TitleText (upval)
					local Theme = p2.Theme
					
					return ReactModule.createElement("TextLabel", {
						TextSize = 20,
						TextWrapped = true,
						BackgroundTransparency = 1,
						Text = TitleText,
						Font = p2.Font.Header2.Font,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Center,
						Size = UDim2.new(1, 0, 1, 0)
					})
				end)
			end
		})
	})
end