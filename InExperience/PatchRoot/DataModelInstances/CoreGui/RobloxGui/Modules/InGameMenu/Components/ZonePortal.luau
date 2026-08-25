local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local directionModule = require(parent.Enums.Direction)
local setCurrentZoneModule = require(parent.Actions.SetCurrentZone)
local portalSize = constantsModule.Zone.PortalSize
local t_1 = {
	[directionModule.Up] = {
		size = UDim2.new(1, 0, 0, portalSize),
		position = UDim2.new(0, 0, 0, 0)
	},
	[directionModule.Down] = {
		size = UDim2.new(1, 0, 0, portalSize),
		position = UDim2.new(0, 0, 1, -portalSize)
	},
	[directionModule.Left] = {
		size = UDim2.new(0, portalSize, 1, 0),
		position = UDim2.new(0, 0, 0, 0)
	},
	[directionModule.Right] = {
		size = UDim2.new(0, portalSize, 1, 0),
		position = UDim2.new(1, -portalSize, 0, 0)
	}
}
local zonePortal = roact.PureComponent:extend("ZonePortal")
zonePortal.validateProps = t.strictInterface({
	targetZone = t.number,
	direction = directionModule.isEnumValue,
	setCurrentZone = t.optional(t.callback)
})

function zonePortal.render(p0)
	-- upvalues: t_1 (ref), var3 (ref), roact (ref), var4 (ref)
	local direction = t_1[p0.props.direction]
	
	return var3(function(p1)
		-- upvalues: roact (copy), direction (ref), var4 (copy), p0 (ref)
		return roact.createElement("Frame", {
			Size = direction.size,
			Position = direction.position,
			BackgroundTransparency = 1,
			Selectable = true,
			ZIndex = 2147483647,
			SelectionImageObject = p1(var4.Invisible),
			[roact.Event.SelectionGained] = function()
				-- upvalues: p0 (copy)
				p0.props.setCurrentZone(p0.props.targetZone)
			end
		})
	end)
end

return roactRodux.UNSTABLE_connect2(nil, function(p2)
	-- upvalues: setCurrentZoneModule (ref)
	return {
		setCurrentZone = function(value)
			-- upvalues: p2 (ref), setCurrentZoneModule (copy)
			return p2(setCurrentZoneModule(value))
		end
	}
end)(zonePortal)