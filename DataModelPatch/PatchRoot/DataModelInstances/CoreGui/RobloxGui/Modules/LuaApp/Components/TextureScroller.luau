local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RunService = game:GetService("RunService")
local RoactModule = require(Modules.Common.Roact)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local FFlagMigrateRoactUtilsToReactUtils = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils()
local TextureScroller = RoactModule.PureComponent:extend("TextureScroller")

function TextureScroller.init(p1)
	-- upvalues: RoactModule (copy), FFlagMigrateRoactUtilsToReactUtils (copy)
	p1.lerpValue = 0
	p1.imageRef = RoactModule.createRef()
	
	function p1.renderSteppedCallback(p2)
		-- upvalues: p1 (copy), FFlagMigrateRoactUtilsToReactUtils (upval)
		local ImageScrollCycleTime = p1.props.imageScrollCycleTime
		local ImagePositionStart = p1.props.imagePositionStart
		local ImagePositionEnd = p1.props.imagePositionEnd
		p1.lerpValue = (p1.lerpValue + (if ImageScrollCycleTime == 0 then 0 else p2 / ImageScrollCycleTime)) % 1
		
		if not FFlagMigrateRoactUtilsToReactUtils or p1.imageRef.current then
			p1.imageRef.current.Position = ImagePositionStart:lerp(ImagePositionEnd, p1.lerpValue)
		end
	end
end

function TextureScroller.render(p1)
	-- upvalues: ArgCheckModule (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy), ExternalEventConnectionModule (copy), RunService (copy)
	ArgCheckModule.isType(p1.props.Image, "string", "self.props.Image")
	ArgCheckModule.isType(p1.props.imageScrollCycleTime, "number", "self.props.imageScrollCycleTime")
	ArgCheckModule.isType(p1.props.imagePositionStart, "UDim2", "self.props.imagePositionStart")
	ArgCheckModule.isType(p1.props.imagePositionEnd, "UDim2", "self.props.imagePositionEnd")
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p1.props.Size,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
			Size = p1.props.imageSize,
			Position = p1.props.imagePositionStart,
			AnchorPoint = p1.props.imageAnchorPoint,
			BackgroundTransparency = 1,
			Image = p1.props.Image,
			ImageTransparency = p1.props.ImageTransparency,
			[RoactModule.Ref] = p1.imageRef
		}),
		renderStepped = RoactModule.createElement(ExternalEventConnectionModule, {
			event = RunService.renderStepped,
			callback = p1.renderSteppedCallback
		})
	})
end

return TextureScroller