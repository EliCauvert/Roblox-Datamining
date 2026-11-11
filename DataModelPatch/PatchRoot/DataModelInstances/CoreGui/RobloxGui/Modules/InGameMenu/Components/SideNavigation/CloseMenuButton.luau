local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local GlobalConfigModule = require(Parent.GlobalConfig)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local ControlState = FoundationModule.Enums.ControlState
local StrictInterfaceResult = T.strictInterface({
	AnchorPoint = T.optional(T.Vector2),
	Position = T.optional(T.UDim2),
	layoutOrder = T.optional(T.integer),
	onActivated = T.callback,
	onSelectionGained = T.optional(T.callback),
	onSelectionLost = T.optional(T.callback),
	forwardRef = T.optional(T.table)
})

local function _(SelectedPressed): boolean
	-- upvalues: ControlState (copy)
	return SelectedPressed == ControlState.Selected or SelectedPressed == ControlState.SelectedPressed
end

local CloseMenuButton = nil

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation then
	CloseMenuButton = Roact.Component:extend("CloseMenuButton")
	
	function CloseMenuButton.init(p1)
		p1.wasSelected = false
	end
	
	function CloseMenuButton.render(p1)
		-- upvalues: WithSelectionCursorProviderFunction (copy), GlobalConfigModule (copy), StrictInterfaceResult (copy), Roact (copy), Image (copy), AssetsModule (copy), CursorKind (copy), ControlState (copy)
		local Props = p1.props
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: GlobalConfigModule (upval), StrictInterfaceResult (upval), Props (copy), Roact (upval), Image (upval), AssetsModule (upval), CursorKind (upval), ControlState (upval), p1 (copy)
			if GlobalConfigModule.propValidation then
				assert(StrictInterfaceResult(Props))
			end
			return Roact.createElement(Image, {
				AnchorPoint = Props.AnchorPoint,
				Position = Props.Position,
				Size = UDim2.new(0, 32, 0, 32),
				LayoutOrder = Props.layoutOrder,
				Image = AssetsModule.Images.CloseButton,
				selection = { SelectionImageObject = Callback(CursorKind.RoundedRect) },
				onActivated = Props.onActivated,
				onStateChanged = function(SelectedPressed)
					-- upvalues: ControlState (upval), p1 (upval), Props (upval)
					local IsSelectedPressedMatch: boolean = SelectedPressed == ControlState.Selected or SelectedPressed == ControlState.SelectedPressed
					
					if IsSelectedPressedMatch and not p1.wasSelected then
						if Props.onSelectionGained then
							Props.onSelectionGained()
						end
					elseif not IsSelectedPressedMatch and p1.wasSelected and Props.onSelectionLost then
						Props.onSelectionLost()
					end
					p1.wasSelected = IsSelectedPressedMatch
				end,
				ref = Props.forwardRef
			})
		end)
	end
else
	CloseMenuButton = function(Frame)
		-- upvalues: WithSelectionCursorProviderFunction (copy), GlobalConfigModule (copy), StrictInterfaceResult (copy), Roact (copy), ImageSetButton (copy), AssetsModule (copy), CursorKind (copy)
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: GlobalConfigModule (upval), StrictInterfaceResult (upval), Frame (copy), Roact (upval), ImageSetButton (upval), AssetsModule (upval), CursorKind (upval)
			if GlobalConfigModule.propValidation then
				assert(StrictInterfaceResult(Frame))
			end
			return Roact.createElement(ImageSetButton, {
				AnchorPoint = Frame.AnchorPoint,
				BackgroundTransparency = 1,
				Image = AssetsModule.Images.CloseButton,
				Position = Frame.Position,
				Size = UDim2.new(0, 32, 0, 32),
				LayoutOrder = Frame.layoutOrder,
				SelectionImageObject = Callback(CursorKind.RoundedRect),
				[Roact.Event.Activated] = Frame.onActivated,
				[Roact.Event.SelectionGained] = Frame.onSelectionGained,
				[Roact.Event.SelectionLost] = Frame.onSelectionLost,
				[Roact.Ref] = Frame.forwardRef
			})
		end)
	end
end
return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), CloseMenuButton (ref), Cryo (copy)
	return Roact.createElement(CloseMenuButton, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)