local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local HumanoidViewportModule = require(Parent.HumanoidViewport)
local ItemsListModule = require(Parent.ItemsList)
local SignalSaveAvatarPermissionDeniedModule = require(Parent1.Thunks.SignalSaveAvatarPermissionDenied)
local PerformSaveAvatarModule = require(Parent1.Thunks.PerformSaveAvatar)
local GetConformedHumanoidDescriptionModule = require(Parent1.GetConformedHumanoidDescription)
local SaveAvatarPrompt = RoactModule.PureComponent:extend("SaveAvatarPrompt")
SaveAvatarPrompt.validateProps = TModule.strictInterface({
	gameName = TModule.string,
	screenSize = TModule.Vector2,
	humanoidDescription = TModule.instanceOf("HumanoidDescription"),
	rigType = TModule.enum(Enum.HumanoidRigType),
	performSaveAvatar = TModule.callback,
	signalSaveAvatarPermissionDenied = TModule.callback
})

function SaveAvatarPrompt.init(p1) --[[ Line: 47 ]]
	-- upvalues: RoactModule (copy), ItemsListModule (copy), HumanoidViewportModule (copy)
	p1.mounted = false
	p1:setState({
		conformedHumanoidDescription = nil,
		getConformedDescriptionFailed = false,
		itemListScrollable = false
	})
	p1.middleContentRef = RoactModule.createRef()
	p1.contentSize, p1.updateContentSize = RoactModule.createBinding(UDim2.new(1, 0, 0, 200))
	
	function p1.onAlertSizeChanged(Frame) --[[ Line: 59 ]]
		-- upvalues: p1 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if not p1.middleContentRef:getValue() then return end
		local Y = p1.middleContentRef:getValue().AbsoluteSize.Y
		local YDelta = p1.props.screenSize.Y - 60 - (AbsoluteSize.Y - Y)
		local NewX = p1.middleContentRef:getValue().AbsoluteSize.X / 2 - 10 + 80
		
		if NewX < YDelta then
			YDelta = NewX
		end
		if Y ~= YDelta then
			p1.updateContentSize(UDim2.new(1, 0, 0, YDelta))
		end
	end
	
	function p1.itemListScrollableUpdated(ItemListScrollable, Offset) --[[ Line: 82 ]]
		-- upvalues: p1 (copy)
		if Offset == p1.contentSize:getValue().Y.Offset then
			p1:setState({ itemListScrollable = ItemListScrollable })
		end
	end
	
	function p1.retryLoadDescription() --[[ Line: 90 ]]
		-- upvalues: p1 (copy)
		p1:setState({ getConformedDescriptionFailed = false })
		p1:getConformedHumanoidDescription()
	end
	
	function p1.renderAlertMiddleContent() --[[ Line: 98 ]]
		-- upvalues: p1 (copy), RoactModule (upval), ItemsListModule (upval), HumanoidViewportModule (upval)
		local ConformedHumanoidDescription = p1.state.conformedHumanoidDescription
		local GetConformedDescriptionFailed = p1.state.getConformedDescriptionFailed
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.contentSize,
			[RoactModule.Ref] = p1.middleContentRef
		}, {
			ItemsListFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.45, 1)
			}, {
				ItemsList = RoactModule.createElement(ItemsListModule, {
					humanoidDescription = ConformedHumanoidDescription,
					retryLoadDescription = p1.retryLoadDescription,
					loadingFailed = GetConformedDescriptionFailed,
					itemListScrollableUpdated = p1.itemListScrollableUpdated
				})
			}),
			HumanoidViewportFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.fromScale(0.55, 1),
				Position = UDim2.fromScale(0.45, 0)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5)
				}),
				HumanoidViewport = RoactModule.createElement(HumanoidViewportModule, {
					humanoidDescription = ConformedHumanoidDescription,
					loadingFailed = GetConformedDescriptionFailed,
					retryLoadDescription = p1.retryLoadDescription,
					rigType = p1.props.rigType
				})
			}),
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = p1.contentMaxSize })
		})
	end
end

function SaveAvatarPrompt.render(p1) --[[ Line: 146 ]]
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptTitle"),
		bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptText", { RBX_NAME = p1.props.gameName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalSaveAvatarPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.props.performSaveAvatar,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		middleContent = p1.renderAlertMiddleContent,
		onAbsoluteSizeChanged = p1.onAlertSizeChanged,
		isMiddleContentFocusable = p1.state.itemListScrollable
	})
end

function SaveAvatarPrompt.getConformedHumanoidDescription(p1, HumanoidDescription) --[[ Line: 179 ]]
	-- upvalues: GetConformedHumanoidDescriptionModule (copy)
	GetConformedHumanoidDescriptionModule(HumanoidDescription, true):andThen(function(Result) --[[ Line: 181 ]]
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState({ conformedHumanoidDescription = Result })
			
			return
		end
	end, function(_) --[[ Line: 189 ]]
		-- upvalues: p1 (copy)
		if p1.mounted then
			p1:setState({ getConformedDescriptionFailed = true })
			
			return
		end
	end)
end

function SaveAvatarPrompt.didMount(p1) --[[ Line: 200 ]]
	p1.mounted = true
	p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
end

function SaveAvatarPrompt.didUpdate(p1, p2, _) --[[ Line: 206 ]]
	-- upvalues: RoactModule (copy)
	if p1.props.humanoidDescription ~= p2.humanoidDescription then
		p1:setState({
			getConformedDescriptionFailed = false,
			conformedHumanoidDescription = RoactModule.None
		})
		p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
	end
end

function SaveAvatarPrompt.willUnmount(p1) --[[ Line: 217 ]]
	p1.mounted = false
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 221 | Named "mapStateToProps" ]]
	return {
		gameName = p1.gameName,
		screenSize = p1.screenSize,
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType
	}
end, function(Callback) --[[ Line: 230 | Named "mapDispatchToProps" ]]
	-- upvalues: SignalSaveAvatarPermissionDeniedModule (copy), PerformSaveAvatarModule (copy)
	return {
		signalSaveAvatarPermissionDenied = function() --[[ Line: 232 ]]
			-- upvalues: Callback (copy), SignalSaveAvatarPermissionDeniedModule (upval)
			return Callback(SignalSaveAvatarPermissionDeniedModule)
		end,
		performSaveAvatar = function() --[[ Line: 236 ]]
			-- upvalues: Callback (copy), PerformSaveAvatarModule (upval)
			return Callback(PerformSaveAvatarModule)
		end
	}
end)(SaveAvatarPrompt)