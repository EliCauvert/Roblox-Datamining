local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local image = foundationModule.Image
local controlState = foundationModule.Enums.ControlState
local var3 = t.strictInterface({
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback,
	onSelectionGained = t.optional(t.callback),
	onSelectionLost = t.optional(t.callback),
	forwardRef = t.optional(t.table)
})

local function _(p1)
	-- upvalues: controlState (ref)
	return if p1 ~= controlState.Selected then p1 == controlState.SelectedPressed else true
end

local _ = nil

if fFlagCoreUiMigrateUIBloxToFoundation then
	local var4 = roact.Component:extend("CloseMenuButton")
	
	function var8.init(p1)
		p1.wasSelected = false
	end
	
	function var8.render(p1)
		-- upvalues: var1 (ref), globalConfigModule (ref), var3 (ref), roact (ref), image (ref), assetsModule (ref), var2 (ref), controlState (ref)
		local props = p1.props
		
		return var1(function(p2)
			-- upvalues: globalConfigModule (copy), var3 (copy), props (ref), roact (copy), image (copy), assetsModule (copy), var2 (copy), controlState (copy), p1 (ref)
			if globalConfigModule.propValidation then
				assert(var3(props))
			end
			return roact.createElement(image, {
				AnchorPoint = props.AnchorPoint,
				Position = props.Position,
				Size = UDim2.new(0, 32, 0, 32),
				backgroundStyle = { Transparency = 1 },
				LayoutOrder = props.layoutOrder,
				Image = assetsModule.Images.CloseButton,
				selection = { SelectionImageObject = p2(var2.RoundedRect) },
				onActivated = props.onActivated,
				onStateChanged = function(p3)
					-- upvalues: controlState (copy), p1 (copy), props (copy)
					local var5 = if p3 ~= controlState.Selected then p3 == controlState.SelectedPressed else true
					
					if var5 and not p1.wasSelected then
						if props.onSelectionGained then
							props.onSelectionGained()
						end
					elseif not var5 and p1.wasSelected and props.onSelectionLost then
						props.onSelectionLost()
					end
					p1.wasSelected = var5
				end,
				ref = props.forwardRef
			})
		end)
	end
else
	local var4 = function(p1)
		-- upvalues: var1 (ref), globalConfigModule (ref), var3 (ref), roact (ref), imageSetButton (ref), assetsModule (ref), var2 (ref)
		return var1(function(p2)
			-- upvalues: globalConfigModule (copy), var3 (copy), p1 (ref), roact (copy), imageSetButton (copy), assetsModule (copy), var2 (copy)
			if globalConfigModule.propValidation then
				assert(var3(p1))
			end
			return roact.createElement(imageSetButton, {
				AnchorPoint = p1.AnchorPoint,
				BackgroundTransparency = 1,
				Image = assetsModule.Images.CloseButton,
				Position = p1.Position,
				Size = UDim2.new(0, 32, 0, 32),
				LayoutOrder = p1.layoutOrder,
				SelectionImageObject = p2(var2.RoundedRect),
				[roact.Event.Activated] = p1.onActivated,
				[roact.Event.SelectionGained] = p1.onSelectionGained,
				[roact.Event.SelectionLost] = p1.onSelectionLost,
				[roact.Ref] = p1.forwardRef
			})
		end)
	end
end
return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), var4 (write), cryo (ref)
	return roact.createElement(var4, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)