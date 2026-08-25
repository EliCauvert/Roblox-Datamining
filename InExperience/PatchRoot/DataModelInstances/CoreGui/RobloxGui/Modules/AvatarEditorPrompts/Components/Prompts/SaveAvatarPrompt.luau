local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local humanoidViewportModule = require(parent.HumanoidViewport)
local itemsListModule = require(parent.ItemsList)
local signalSaveAvatarPermissionDeniedModule = require(parent_1.Thunks.SignalSaveAvatarPermissionDenied)
local performSaveAvatarModule = require(parent_1.Thunks.PerformSaveAvatar)
local getConformedHumanoidDescriptionModule = require(parent_1.GetConformedHumanoidDescription)
local saveAvatarPrompt = roactModule.PureComponent:extend("SaveAvatarPrompt")
saveAvatarPrompt.validateProps = tModule.strictInterface({
	gameName = tModule.string,
	screenSize = tModule.Vector2,
	humanoidDescription = tModule.instanceOf("HumanoidDescription"),
	rigType = tModule.enum(Enum.HumanoidRigType),
	performSaveAvatar = tModule.callback,
	signalSaveAvatarPermissionDenied = tModule.callback
})

function saveAvatarPrompt.init(p0)
	-- upvalues: roactModule (ref), itemsListModule (ref), humanoidViewportModule (ref)
	p0.mounted = false
	p0:setState({
		conformedHumanoidDescription = nil,
		getConformedDescriptionFailed = false,
		itemListScrollable = false
	})
	p0.middleContentRef = roactModule.createRef()
	local var13, var14 = roactModule.createBinding(UDim2.new(1, 0, 0, 200))
	p0.contentSize = var13
	p0.updateContentSize = var14
	
	function p0.onAlertSizeChanged(p1)
		-- upvalues: p0 (ref)
		local absoluteSize = p1.AbsoluteSize
		
		if not p0.middleContentRef:getValue() then return end
		local y = p0.middleContentRef:getValue().AbsoluteSize.Y
		local var15 = p0.props.screenSize.Y - 60 - (absoluteSize.Y - y)
		local var16 = p0.middleContentRef:getValue().AbsoluteSize.X / 2 - 10 + 80
		
		if var16 < var15 then
			var15 = var16
		end
		if y ~= var15 then
			p0.updateContentSize(UDim2.new(1, 0, 0, var15))
		end
	end
	
	function p0.itemListScrollableUpdated(p2, p3)
		-- upvalues: p0 (ref)
		if p3 == p0.contentSize:getValue().Y.Offset then
			p0:setState({ itemListScrollable = p2 })
		end
	end
	
	function p0.retryLoadDescription()
		-- upvalues: p0 (ref)
		p0:setState({ getConformedDescriptionFailed = false })
		p0:getConformedHumanoidDescription()
	end
	
	function p0.renderAlertMiddleContent()
		-- upvalues: p0 (ref), roactModule (copy), itemsListModule (copy), humanoidViewportModule (copy)
		local conformedHumanoidDescription = p0.state.conformedHumanoidDescription
		local getConformedDescriptionFailed = p0.state.getConformedDescriptionFailed
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p0.contentSize,
			[roactModule.Ref] = p0.middleContentRef
		}, {
			ItemsListFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.45, 1)
			}, {
				ItemsList = roactModule.createElement(itemsListModule, {
					humanoidDescription = conformedHumanoidDescription,
					retryLoadDescription = p0.retryLoadDescription,
					loadingFailed = getConformedDescriptionFailed,
					itemListScrollableUpdated = p0.itemListScrollableUpdated
				})
			}),
			HumanoidViewportFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.fromScale(0.55, 1),
				Position = UDim2.fromScale(0.45, 0)
			}, {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5)
				}),
				HumanoidViewport = roactModule.createElement(humanoidViewportModule, {
					humanoidDescription = conformedHumanoidDescription,
					loadingFailed = getConformedDescriptionFailed,
					retryLoadDescription = p0.retryLoadDescription,
					rigType = p0.props.rigType
				})
			}),
			UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p0.contentMaxSize })
		})
	end
end

function saveAvatarPrompt.render(p4)
	-- upvalues: roactModule (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(interactiveAlert, {
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptText", { RBX_NAME = p4.props.gameName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p4.props.signalSaveAvatarPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p4.props.performSaveAvatar,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptYes")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p4.props.screenSize,
		middleContent = p4.renderAlertMiddleContent,
		onAbsoluteSizeChanged = p4.onAlertSizeChanged,
		isMiddleContentFocusable = p4.state.itemListScrollable
	})
end

function saveAvatarPrompt.getConformedHumanoidDescription(p5, p6)
	-- upvalues: getConformedHumanoidDescriptionModule (ref)
	getConformedHumanoidDescriptionModule(p6, true):andThen(function(p7)
		-- upvalues: p5 (ref)
		if p5.mounted then
			p5:setState({ conformedHumanoidDescription = p7 })
			
			return
		end
	end, function(_)
		-- upvalues: p5 (ref)
		if p5.mounted then
			p5:setState({ getConformedDescriptionFailed = true })
			
			return
		end
	end)
end

function saveAvatarPrompt.didMount(p8)
	p8.mounted = true
	p8:getConformedHumanoidDescription(p8.props.humanoidDescription)
end

function saveAvatarPrompt.didUpdate(p9, p10, _)
	-- upvalues: roactModule (ref)
	if p9.props.humanoidDescription ~= p10.humanoidDescription then
		p9:setState({
			getConformedDescriptionFailed = false,
			conformedHumanoidDescription = roactModule.None
		})
		p9:getConformedHumanoidDescription(p9.props.humanoidDescription)
	end
end

function saveAvatarPrompt.willUnmount(p11)
	p11.mounted = false
end

return roactRoduxModule.connect(function(p12)
	return {
		gameName = p12.gameName,
		screenSize = p12.screenSize,
		humanoidDescription = p12.promptInfo.humanoidDescription,
		rigType = p12.promptInfo.rigType
	}
end, function(p13)
	-- upvalues: signalSaveAvatarPermissionDeniedModule (ref), performSaveAvatarModule (ref)
	return {
		signalSaveAvatarPermissionDenied = function()
			-- upvalues: p13 (ref), signalSaveAvatarPermissionDeniedModule (copy)
			return p13(signalSaveAvatarPermissionDeniedModule)
		end,
		performSaveAvatar = function()
			-- upvalues: p13 (ref), performSaveAvatarModule (copy)
			return p13(performSaveAvatarModule)
		end
	}
end)(saveAvatarPrompt)