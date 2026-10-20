local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
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
	-- upvalues: WithStyleFunction (copy), ReactModule (copy)
	return function()
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy)
		return WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Text (upval)
			local CurrentCamera = game.Workspace.CurrentCamera
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

return function(p1)
	-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), WithStyleFunction (copy)
	local CreateElementFunction1 = ReactModule.createElement
	local v1 = "Frame"
	local config = {
		BackgroundTransparency = 0,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#4F545F"),
		Size = UDim2.new(1, 0, 0, 48)
	}
	local t = {}
	local CreateElementFunction = ReactModule.createElement
	local BackAction = p1.backAction
	local _ = p1.isRedoEnabled
	local _ = p1.isUndoEnabled
	local config1 = {
		backgroundTransparency = 1,
		barHeight = 48,
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
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy)
		return WithStyleFunction(function(p2)
			-- upvalues: ReactModule (upval), TitleText (upval)
			local CurrentCamera = game.Workspace.CurrentCamera
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
				Size = UDim2.new(0, if CurrentCamera == nil then 300 else CurrentCamera.ViewportSize.X - 150, 1, 0)
			})
		end)
	end
	
	t.Bar = CreateElementFunction(HeaderBar, config1)
	
	return CreateElementFunction1(v1, config, t)
end