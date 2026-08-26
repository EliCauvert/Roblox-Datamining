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

function saveAvatarPrompt.init(p1)
	-- upvalues: roactModule (ref), itemsListModule (ref), humanoidViewportModule (ref)
	p1.mounted = false
	p1:setState({
		conformedHumanoidDescription = nil,
		getConformedDescriptionFailed = false,
		itemListScrollable = false
	})
	p1.middleContentRef = roactModule.createRef()
	local var1, var2 = roactModule.createBinding(UDim2.new(1, 0, 0, 200))
	p1.contentSize = var1
	p1.updateContentSize = var2
	
	function p0.onAlertSizeChanged(p2)
		-- upvalues: p1 (ref)
		local absoluteSize = p2.AbsoluteSize
		
		if not p1.middleContentRef:getValue() then return end
		local y = p1.middleContentRef:getValue().AbsoluteSize.Y
		local var3 = p1.props.screenSize.Y - 60 - (absoluteSize.Y - y)
		local var4 = p1.middleContentRef:getValue().AbsoluteSize.X / 2 - 10 + 80
		
		if var4 < var3 then
			var3 = var4
		end
		if y ~= var3 then
			p1.updateContentSize(UDim2.new(1, 0, 0, var3))
		end
	end
	
	function p0.itemListScrollableUpdated(p2, p3)
		-- upvalues: p1 (ref)
		if p3 == p1.contentSize:getValue().Y.Offset then
			p1:setState({ itemListScrollable = p2 })
		end
	end
	
	function p0.retryLoadDescription()
		-- upvalues: p1 (ref)
		p1:setState({ getConformedDescriptionFailed = false })
		p1:getConformedHumanoidDescription()
	end
	
	function p0.renderAlertMiddleContent()
		-- upvalues: p1 (ref), roactModule (copy), itemsListModule (copy), humanoidViewportModule (copy)
		local conformedHumanoidDescription = p1.state.conformedHumanoidDescription
		local getConformedDescriptionFailed = p1.state.getConformedDescriptionFailed
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.contentSize,
			[roactModule.Ref] = p1.middleContentRef
		}, {
			ItemsListFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0.45, 1)
			}, {
				ItemsList = roactModule.createElement(itemsListModule, {
					humanoidDescription = conformedHumanoidDescription,
					retryLoadDescription = p1.retryLoadDescription,
					loadingFailed = getConformedDescriptionFailed,
					itemListScrollableUpdated = p1.itemListScrollableUpdated
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
					retryLoadDescription = p1.retryLoadDescription,
					rigType = p1.props.rigType
				})
			}),
			UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p1.contentMaxSize })
		})
	end
end

function saveAvatarPrompt.render(p1)
	-- upvalues: roactModule (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(interactiveAlert, {
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptText", { RBX_NAME = p1.props.gameName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalSaveAvatarPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.props.performSaveAvatar,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.SaveAvatarPromptYes")
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

function saveAvatarPrompt.getConformedHumanoidDescription(p1, p2)
	-- upvalues: getConformedHumanoidDescriptionModule (ref)
	getConformedHumanoidDescriptionModule(p2, true):andThen(function(p3)
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState({ conformedHumanoidDescription = p3 })
			
			return
		end
	end, function(_)
		-- upvalues: p1 (ref)
		if p1.mounted then
			p1:setState({ getConformedDescriptionFailed = true })
			
			return
		end
	end)
end

function saveAvatarPrompt.didMount(p1)
	p1.mounted = true
	p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
end

function saveAvatarPrompt.didUpdate(p1, p2, _)
	-- upvalues: roactModule (ref)
	if p1.props.humanoidDescription ~= p2.humanoidDescription then
		p1:setState({
			getConformedDescriptionFailed = false,
			conformedHumanoidDescription = roactModule.None
		})
		p1:getConformedHumanoidDescription(p1.props.humanoidDescription)
	end
end

function saveAvatarPrompt.willUnmount(p1)
	p1.mounted = false
end

return roactRoduxModule.connect(function(p1)
	return {
		gameName = p1.gameName,
		screenSize = p1.screenSize,
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType
	}
end, function(p1)
	-- upvalues: signalSaveAvatarPermissionDeniedModule (ref), performSaveAvatarModule (ref)
	return {
		signalSaveAvatarPermissionDenied = function()
			-- upvalues: p1 (ref), signalSaveAvatarPermissionDeniedModule (copy)
			return p1(signalSaveAvatarPermissionDeniedModule)
		end,
		performSaveAvatar = function()
			-- upvalues: p1 (ref), performSaveAvatarModule (copy)
			return p1(performSaveAvatarModule)
		end
	}
end)(saveAvatarPrompt)