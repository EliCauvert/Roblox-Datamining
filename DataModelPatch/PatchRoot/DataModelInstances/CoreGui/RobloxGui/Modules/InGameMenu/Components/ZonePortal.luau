local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent
local DirectionModule = require(Parent.Enums.Direction)
local SetCurrentZoneModule = require(Parent.Actions.SetCurrentZone)
local PortalSize = require(Parent.Resources.Constants).Zone.PortalSize
local config = {
	[DirectionModule.Up] = {
		size = UDim2.new(1, 0, 0, PortalSize),
		position = UDim2.new(0, 0, 0, 0)
	},
	[DirectionModule.Down] = {
		size = UDim2.new(1, 0, 0, PortalSize),
		position = UDim2.new(0, 0, 1, -PortalSize)
	},
	[DirectionModule.Left] = {
		size = UDim2.new(0, PortalSize, 1, 0),
		position = UDim2.new(0, 0, 0, 0)
	},
	[DirectionModule.Right] = {
		size = UDim2.new(0, PortalSize, 1, 0),
		position = UDim2.new(1, -PortalSize, 0, 0)
	}
}
local ZonePortal = Roact.PureComponent:extend("ZonePortal")
ZonePortal.validateProps = T.strictInterface({
	targetZone = T.number,
	direction = DirectionModule.isEnumValue,
	setCurrentZone = T.optional(T.callback)
})

function ZonePortal.render(p1)
	-- upvalues: config (copy), WithSelectionCursorProviderFunction (copy), Roact (copy), CursorKind (copy)
	local Entry = config[p1.props.direction]
	
	return WithSelectionCursorProviderFunction(function(Callback)
		-- upvalues: Roact (upval), Entry (copy), CursorKind (upval), p1 (copy)
		return Roact.createElement("Frame", {
			Size = Entry.size,
			Position = Entry.position,
			BackgroundTransparency = 1,
			Selectable = true,
			ZIndex = 2147483647,
			SelectionImageObject = Callback(CursorKind.Invisible),
			[Roact.Event.SelectionGained] = function()
				-- upvalues: p1 (upval)
				p1.props.setCurrentZone(p1.props.targetZone)
			end
		})
	end)
end

return (RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: SetCurrentZoneModule (copy)
	return {
		setCurrentZone = function(p1)
			-- upvalues: Callback (copy), SetCurrentZoneModule (upval)
			return Callback(SetCurrentZoneModule(p1))
		end
	}
end)(ZonePortal))