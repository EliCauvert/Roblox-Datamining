local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local PageButtonModule = require(Modules.AvatarExperience.Common.Components.Landing.PageButton)
local ThumbnailSideModule = require(Modules.AvatarExperience.Common.Components.Landing.ThumbnailSide)
local IconsMenuProfilepictureLarge = require(CorePackages.Packages.UIBlox).App.ImageSet.Images["icons/menu/profilepicture_large"]
local _Vector2 = Vector2.new(40, 0)
local _Vector2_1 = Vector2.new(0, 0)
local _Vector2_2 = Vector2.new(382 - _Vector2.X, 340)
local _Vector2_3 = Vector2.new(228 - _Vector2_1.X, 360)
local ProfilePictureEditorPageButton = RoactModule.PureComponent:extend("ProfilePictureEditorPageButton")
ProfilePictureEditorPageButton.validateProps = TModule.strictInterface({
	transparencyModifier = TModule.number,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	onActivated = TModule.callback,
	forwardRef = TModule.optional(TModule.table)
})
ProfilePictureEditorPageButton.defaultProps = { transparencyModifier = 0 }

function ProfilePictureEditorPageButton.init(p1)
	-- upvalues: NotificationService (copy)
	p1:setState({ style = string.lower(NotificationService.SelectedTheme) })
end

function ProfilePictureEditorPageButton.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		ppeButtonText = "Feature.Avatar.Action.EditProfilePicture"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function ProfilePictureEditorPageButton.renderWithProviders(p1, p2)
	-- upvalues: RoactModule (copy), PageButtonModule (copy), IconsMenuProfilepictureLarge (copy), ThumbnailSideModule (copy), _Vector2_2 (copy), _Vector2 (copy), _Vector2_3 (copy), _Vector2_1 (copy)
	return RoactModule.createElement(PageButtonModule, {
		Size = UDim2.new(1, 0, 1, 0),
		backgroundImage = if p1.state.style == "dark" then "rbxasset://textures/AvatarEditorImages/AvatarEditor.png" else "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png",
		icon = IconsMenuProfilepictureLarge,
		text = p2.ppeButtonText,
		transparencyModifier = p1.props.transparencyModifier,
		ignoreThumbnail = true,
		iconBeforeText = true,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.forwardRef,
		extraThumbnails = {
			{
				image = "rbxasset://textures/ui/AvatarExperience/Avatar1_PPEButton.png",
				paddingTopScale = 0.04,
				paddingBottomScale = 0,
				paddingSideScale = 0.02,
				side = ThumbnailSideModule.Left,
				imageRectSize = _Vector2_2,
				imageRectOffset = _Vector2
			},
			{
				image = "rbxasset://textures/ui/AvatarExperience/Avatar2_PPEButton.png",
				paddingTopScale = 0.04,
				paddingBottomScale = 0,
				paddingSideScale = 0.04,
				side = ThumbnailSideModule.Right,
				imageRectSize = _Vector2_3,
				imageRectOffset = _Vector2_1
			}
		},
		onActivated = p1.props.onActivated
	})
end

function ProfilePictureEditorPageButton.didMount(p1)
	-- upvalues: NotificationService (copy)
	p1.themeChangedConn = NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
		-- upvalues: p1 (copy), NotificationService (upval)
		p1:setState({ style = string.lower(NotificationService.SelectedTheme) })
	end)
end

function ProfilePictureEditorPageButton.willUnmount(p1)
	if p1.themeChangedConn then
		p1.themeChangedConn:Disconnect()
		p1.themeChangedConn = nil
	end
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), ProfilePictureEditorPageButton (copy), CryoModule (copy)
	return RoactModule.createElement(ProfilePictureEditorPageButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)