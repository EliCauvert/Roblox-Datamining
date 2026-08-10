local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local image = foundationModule.Image
local controlState = foundationModule.Enums.ControlState
local var7 = t.strictInterface({
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback,
	onSelectionGained = t.optional(t.callback),
	onSelectionLost = t.optional(t.callback),
	forwardRef = t.optional(t.table)
})

local function _(p0) --[[ line: 39 | named "isSelectedState" ]]
	-- upvalues: controlState (ref)
	return if p0 ~= controlState.Selected then p0 == controlState.SelectedPressed else true
end

local _ = nil

if fFlagCoreUiMigrateUIBloxToFoundation then
	local var8 = roact.Component:extend("CloseMenuButton")
	
	function var8.init(p1) --[[ line: 48 ]]
		p1.wasSelected = false
	end
	
	function var8.render(p2) --[[ line: 52 ]]
		-- upvalues: var3 (ref), globalConfigModule (ref), var7 (ref), roact (ref), image (ref), assetsModule (ref), var4 (ref), controlState (ref)
		local props = p2.props
		
		return var3(function(p3) --[[ line: 54 ]]
			-- upvalues: globalConfigModule (copy), var7 (copy), props (ref), roact (copy), image (copy), assetsModule (copy), var4 (copy), controlState (copy), p2 (ref)
			if globalConfigModule.propValidation then
				assert(var7(props))
			end
			return roact.createElement(image, {
				AnchorPoint = props.AnchorPoint,
				Position = props.Position,
				Size = UDim2.new(0, 32, 0, 32),
				backgroundStyle = { Transparency = 1 },
				LayoutOrder = props.layoutOrder,
				Image = assetsModule.Images.CloseButton,
				selection = { SelectionImageObject = p3(var4.RoundedRect) },
				onActivated = props.onActivated,
				onStateChanged = function(p4) --[[ line: 68 ]]
					-- upvalues: controlState (copy), p2 (copy), props (copy)
					local var9 = if p4 ~= controlState.Selected then p4 == controlState.SelectedPressed else true
					
					if var9 and not p2.wasSelected then
						if props.onSelectionGained then
							props.onSelectionGained()
						end
					elseif not var9 and p2.wasSelected and props.onSelectionLost then
						props.onSelectionLost()
					end
					p2.wasSelected = var9
				end,
				ref = props.forwardRef
			})
		end)
	end
else
	local var8 = function(p5) --[[ line: 86 ]]
		-- upvalues: var3 (ref), globalConfigModule (ref), var7 (ref), roact (ref), imageSetButton (ref), assetsModule (ref), var4 (ref)
		return var3(function(p6) --[[ line: 87 ]]
			-- upvalues: globalConfigModule (copy), var7 (copy), p5 (ref), roact (copy), imageSetButton (copy), assetsModule (copy), var4 (copy)
			if globalConfigModule.propValidation then
				assert(var7(p5))
			end
			return roact.createElement(imageSetButton, {
				AnchorPoint = p5.AnchorPoint,
				BackgroundTransparency = 1,
				Image = assetsModule.Images.CloseButton,
				Position = p5.Position,
				Size = UDim2.new(0, 32, 0, 32),
				LayoutOrder = p5.layoutOrder,
				SelectionImageObject = p6(var4.RoundedRect),
				[roact.Event.Activated] = p5.onActivated,
				[roact.Event.SelectionGained] = p5.onSelectionGained,
				[roact.Event.SelectionLost] = p5.onSelectionLost,
				[roact.Ref] = p5.forwardRef
			})
		end)
	end
end
return roact.forwardRef(function(p7, p8) --[[ line: 110 ]]
	-- upvalues: roact (ref), var8 (write), cryo (ref)
	return roact.createElement(var8, cryo.Dictionary.join(p7, { forwardRef = p8 }))
end)