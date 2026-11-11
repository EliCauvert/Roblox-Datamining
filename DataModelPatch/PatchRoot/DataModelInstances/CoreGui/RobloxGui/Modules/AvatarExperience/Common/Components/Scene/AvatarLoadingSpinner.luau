local CorePackages = game:GetService("CorePackages")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local AvatarLoadingSpinner = RoactModule.PureComponent:extend("AvatarLoadingSpinner")
AvatarLoadingSpinner.validateProps = TModule.interface({
	currentCharacter = TModule.optional(TModule.instanceIsA("Model")),
	layeredClothingLoading = TModule.boolean,
	hasAvatarData = TModule.boolean,
	ppeEmoteLoading = TModule.optional(TModule.boolean)
})

function AvatarLoadingSpinner.init(p1)
	-- upvalues: RoactModule (copy)
	p1.containerRef = RoactModule.createRef()
	p1.characterScreenPosition, p1.updateCharacterScreenPosition = RoactModule.createBinding(nil)
	p1.containerPositon, p1.updateContainerPosition = RoactModule.createBinding(nil)
	p1.positionBinding = RoactModule.joinBindings({
		characterScreenPosition = p1.characterScreenPosition,
		containerPositon = p1.containerPositon
	}):map(function(p2): UDim2
		local CharacterScreenPosition = p2.characterScreenPosition
		local ContainerPositon = p2.containerPositon
		
		return if CharacterScreenPosition and ContainerPositon then UDim2.fromOffset(CharacterScreenPosition.X - ContainerPositon.X, CharacterScreenPosition.Y - ContainerPositon.Y) else UDim2.fromScale(0.5, 0.5)
	end)
	
	function p1.absolutePositionChanged(Frame)
		-- upvalues: p1 (copy)
		p1.updateContainerPosition(Frame.AbsolutePosition)
	end
	
	function p1.renderStepped()
		-- upvalues: p1 (copy)
		p1:updateSpinnerPosition()
	end
end

function AvatarLoadingSpinner.shouldRender(p1)
	return p1.props.ppeEmoteLoading or (p1.props.layeredClothingLoading or not p1.props.hasAvatarData)
end

function AvatarLoadingSpinner.render(p1)
	-- upvalues: RoactModule (copy), Loading (copy), IconSize (copy), ExternalEventConnection (copy), RunService (copy)
	return if p1:shouldRender() then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[RoactModule.Change.AbsolutePosition] = p1.absolutePositionChanged,
		[RoactModule.Ref] = p1.containerRef
	}, {
		LoadingSpinner = RoactModule.createElement(Loading, {
			size = IconSize.Large,
			Position = p1.positionBinding,
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		RenderSteppedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = RunService.RenderStepped,
			callback = p1.renderStepped
		})
	}) else nil
end

function AvatarLoadingSpinner.didMount(p1)
	if p1.containerRef:getValue() then
		p1.absolutePositionChanged(p1.containerRef:getValue())
	end
	p1:updateSpinnerPosition()
end

function AvatarLoadingSpinner.updateSpinnerPosition(p1)
	-- upvalues: Workspace (copy)
	if p1.props.currentCharacter and p1.props.hasAvatarData then
		local BoundingCFrame, _ = p1.props.currentCharacter:GetBoundingBox()
		p1.updateCharacterScreenPosition((Workspace.CurrentCamera:WorldToScreenPoint(BoundingCFrame.Position)))
		
		return
	end
end

function AvatarLoadingSpinner.didUpdate(p1, p2)
	local IsNotCurrentCharacterMatch = p1.props.currentCharacter ~= p2.currentCharacter
	local NoPpeEmoteLoading: boolean = p1.props.ppeEmoteLoading and not p2.ppeEmoteLoading
	
	if p1.props.layeredClothingLoading and not p2.layeredClothingLoading or IsNotCurrentCharacterMatch or NoPpeEmoteLoading then
		p1:updateSpinnerPosition()
	end
end

return (RoactRoduxModule.connect(function(p1, _)
	return {
		currentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter,
		layeredClothingLoading = p1.AvatarExperience.AvatarScene.Character.ApplyingLayeredClothing,
		hasAvatarData = p1.AvatarExperience.AvatarEditor.HasAvatarData,
		ppeEmoteLoading = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.ppeEmoteLoadingCount > 0
	}
end, nil)(AvatarLoadingSpinner))