local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local TextService = game:GetService("TextService")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local Constants = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants
local ShimmerModule = require(RobloxGui.Modules.Shimmer)
local GetFFlagDisplayChannelNameOnErrorPromptModule = require(RobloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)
local LocalizeErrorCodeStringFFlag = settings():GetFFlag("LocalizeErrorCodeString")
local _TweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0)
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

local function _(p1, p2, p3)
	-- upvalues: NewResult (copy)
	local Success, Result = pcall(function()
		-- upvalues: NewResult (upval), p1 (copy), p3 (copy)
		return NewResult:Format(p1, p3)
	end)
	
	return Success and Result or p2
end

local config = {
	Default = function()
		-- upvalues: CreateFunction (copy), Constants (copy)
		return CreateFunction("Frame")({
			Name = "ErrorPrompt",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = Constants.COLORS.FLINT,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, Constants.ERROR_PROMPT_MAX_WIDTH.Default, 0, Constants.ERROR_PROMPT_HEIGHT.Default),
			Visible = false,
			AutoLocalize = false,
			ZIndex = 8,
			CreateFunction("UIListLayout")({
				Name = "PromptLayout",
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			CreateFunction("UIScale")({ Name = "PromptScale", Scale = 0 }),
			CreateFunction("Frame")({
				Name = "TitleFrame",
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, Constants.ERROR_TITLE_FRAME_HEIGHT.Default),
				BorderSizePixel = 0,
				ZIndex = 8,
				CreateFunction("UIPadding")({
					Name = "TitleFramePadding",
					PaddingBottom = UDim.new(0, 11),
					PaddingTop = UDim.new(0, 11)
				}),
				CreateFunction("TextLabel")({
					Name = "ErrorTitle",
					TextSize = 25,
					BackgroundTransparency = 1,
					ZIndex = 8,
					TextColor3 = Constants.COLORS.WHITE,
					Size = UDim2.new(1, 0, 0, 28),
					Font = Enum.Font.SourceSansSemibold,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			}),
			CreateFunction("Frame")({
				Name = "SplitLine",
				LayoutOrder = 2,
				BorderSizePixel = 0,
				ZIndex = 8,
				Size = UDim2.new(1, -2 * Constants.SIDE_PADDING, 0, Constants.SPLIT_LINE_THICKNESS),
				BackgroundColor3 = Constants.COLORS.PUMICE
			}),
			CreateFunction("Frame")({
				Name = "MessageArea",
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, -Constants.ERROR_TITLE_FRAME_HEIGHT.Default - Constants.SPLIT_LINE_THICKNESS),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 8,
				CreateFunction("UIPadding")({
					Name = "MessageAreaPadding",
					PaddingBottom = UDim.new(0, Constants.SIDE_PADDING),
					PaddingLeft = UDim.new(0, Constants.SIDE_PADDING),
					PaddingRight = UDim.new(0, Constants.SIDE_PADDING),
					PaddingTop = UDim.new(0, Constants.SIDE_PADDING)
				}),
				CreateFunction("Frame")({
					Name = "ErrorFrame",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 8,
					CreateFunction("UIListLayout")({
						Name = "ErrorFrameLayout",
						Padding = UDim.new(0, Constants.LAYOUT_PADDING),
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					CreateFunction("TextLabel")({
						Name = "ErrorMessage",
						LayoutOrder = 1,
						TextSize = 20,
						ZIndex = 8,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, -Constants.BUTTON_HEIGHT - Constants.LAYOUT_PADDING),
						TextColor3 = Constants.COLORS.PUMICE,
						Font = Enum.Font.SourceSans
					}),
					CreateFunction("Frame")({
						Name = "ButtonArea",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, Constants.BUTTON_HEIGHT),
						ZIndex = 8,
						LayoutOrder = 2,
						SelectionGroup = true,
						SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
						SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
						SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
						SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
						CreateFunction("UIGridLayout")({
							Name = "ButtonLayout",
							CellPadding = UDim2.new(0, Constants.BUTTON_CELL_PADDING, 0, 0),
							CellSize = UDim2.new(1, 0, 0, Constants.BUTTON_HEIGHT),
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						})
					})
				})
			})
		})
	end
}
local config1 = {
	Default = function(Text, LayoutOrder, p1)
		-- upvalues: CreateFunction (copy), Constants (copy)
		return CreateFunction("ImageButton")({
			Name = Text .. "Button",
			BackgroundTransparency = 1,
			ImageColor3 = p1 and Constants.COLORS.WHITE or Constants.COLORS.PUMICE,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Image = p1 and Constants.PRIMARY_BUTTON_TEXTURE or Constants.SECONDARY_BUTTON_TEXTURE,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			LayoutOrder = LayoutOrder,
			ZIndex = 8,
			CreateFunction("TextLabel")({
				Name = "ButtonText",
				BackgroundTransparency = 1,
				TextSize = 20,
				ZIndex = 8,
				Text = Text,
				Size = UDim2.new(1, 0, 1, 0),
				TextColor3 = p1 and Constants.COLORS.SLATE or Constants.COLORS.PUMICE,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = Enum.Font.SourceSans
			})
		})
	end
}
local ErrorPromptModule = {}
ErrorPromptModule.__index = ErrorPromptModule

function ErrorPromptModule.new(p1, p2)
	-- upvalues: ErrorPromptModule (copy), config (copy), TweenService (copy), _TweenInfo (copy), VRService (copy), UserInputService (copy), GuiService (copy)
	local self = setmetatable({}, ErrorPromptModule)
	self._frame = p1 and config[p1]() or config.Default()
	self._isOpen = false
	self._openAnimation = TweenService:Create(self._frame.PromptScale, _TweenInfo, { Scale = 1 })
	self._closeAnimation = TweenService:Create(self._frame.PromptScale, _TweenInfo, { Scale = 0 })
	self._buttonCount = 0
	self._playAnimation = true
	self._hideErrorCode = false
	self._menuIsOpenKey = "ErrorPrompt"
	
	if p2 then
		if p2.PlayAnimation ~= nil then
			self._playAnimation = p2.PlayAnimation
		end
		if p2.HideErrorCode ~= nil then
			self._hideErrorCode = p2.HideErrorCode
		end
		if p2.MenuIsOpenKey ~= nil then
			self._menuIsOpenKey = p2.MenuIsOpenKey
		end
		self._frame.MessageArea.ErrorFrame.ErrorMessage.TextScaled = p2.MessageTextScaled or false
	end
	if not VRService.VREnabled and UserInputService.GamepadEnabled then
		GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: self (copy), GuiService (upval)
			if self._isOpen and GuiService.SelectedCoreObject == nil then
				GuiService:Select(self._frame.MessageArea.ErrorFrame.ButtonArea)
			end
		end)
	end
	return self
end

local function sinkInput(_, _, _)
	return Enum.ContextActionResult.Sink
end

function ErrorPromptModule:_open(p1, p2, p3)
	-- upvalues: RobloxGui (copy), MouseIconOverrideService (copy), GuiService (copy), VRService (copy), UserInputService (copy), ContextActionService (copy), sinkInput (copy)
	self:setErrorText(p1, p2, p3)
	self:_resizeHeight(RobloxGui.AbsoluteSize.Y)
	
	if not self._isOpen then
		MouseIconOverrideService.push("ErrorPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		GuiService:SetMenuIsOpen(true, self._menuIsOpenKey)
		self._frame.Visible = true
		self._isOpen = true
		
		if self._playAnimation then
			self._openAnimation:Play()
			self._openAnimation.Completed:wait()
			self._frame.PromptScale.Scale = 1
		else
			self._frame.PromptScale.Scale = 1
		end
	end
	if self._isOpen and (VRService.VREnabled or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) then
		GuiService:Select(self._frame.MessageArea.ErrorFrame.ButtonArea)
	end
	ContextActionService:BindCoreAction("ErrorPromptAction", sinkInput, false, Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonStart)
end

function ErrorPromptModule:_close()
	-- upvalues: MouseIconOverrideService (copy), GuiService (copy), ContextActionService (copy)
	if self._isOpen then
		MouseIconOverrideService.pop("ErrorPromptOverride")
		GuiService:SetMenuIsOpen(false, self._menuIsOpenKey)
		self._isOpen = false
		
		if self._playAnimation then
			self._closeAnimation:Play()
			self._closeAnimation.Completed:wait()
		else
			self._frame.PromptScale.Scale = 0
		end
		self._frame.Visible = false
		ContextActionService:UnbindCoreAction("ErrorPromptAction")
	end
end

function ErrorPromptModule:setParent(Parent)
	self._frame.Parent = Parent
end

function ErrorPromptModule:setErrorText(Text, p1, p2)
	-- upvalues: RunService (copy), LocalizeErrorCodeStringFFlag (copy), NewResult (copy), GetFFlagDisplayChannelNameOnErrorPromptModule (copy)
	local ErrorMessage = self._frame.MessageArea.ErrorFrame.ErrorMessage
	local RobloxClientChannel = RunService:GetRobloxClientChannel()
	
	if self._hideErrorCode then
		ErrorMessage.Text = Text
		
		return
	end
	if LocalizeErrorCodeStringFFlag then
		local Value = if p1 then p1.Value else -1
		local Message: string = ("Error Code: %d"):format(Value)
		local config = { ERROR_CODE = tostring(Value) }
		local v1 = "InGame.ConnectionError.Message.ErrorCode"
		local Success, Result = pcall(function()
			-- upvalues: NewResult (upval), v1 (copy), config (copy)
			return NewResult:Format(v1, config)
		end)
		local Result1 = Success and Result or Message
		ErrorMessage.Text = (if GetFFlagDisplayChannelNameOnErrorPromptModule() and p2 and RobloxClientChannel then ("%s\n(%s, %s)"):format(Text, Result1, NewResult:Format("InGame.ConnectionError.Message.ChannelName", { CHANNEL_NAME = RobloxClientChannel }) or ("Channel: %s"):format(RobloxClientChannel)) else nil) or ("%s\n(%s)"):format(Text, Result1)
		
		return
	elseif p1 then
		ErrorMessage.Text = ("%s\n(Error Code: %d)"):format(Text, p1.Value)
		
		return
	else
		ErrorMessage.Text = ("%s\n(Error Code: -1)"):format(Text)
	end
end

function ErrorPromptModule:setErrorTitle(Text, p1)
	-- upvalues: NewResult (copy)
	if not Text then return end
	local ErrorTitle = self._frame.TitleFrame.ErrorTitle
	
	if p1 then
		local v1 = nil
		local Success, Result = pcall(function()
			-- upvalues: NewResult (upval), p1 (copy), v1 (copy)
			return NewResult:Format(p1, v1)
		end)
		ErrorTitle.Text = Success and Result or Text
		
		return
	else
		ErrorTitle.Text = Text
	end
end

function ErrorPromptModule:onErrorChanged(p1, p2, p3)
	if p1 == "" then
		self:_close()
		
		return
	end
	if p1 ~= "" then
		self:_open(p1, p2, p3)
	end
end

function ErrorPromptModule:_relayout()
	-- upvalues: Constants (copy)
	local ButtonArea = self._frame.MessageArea.ErrorFrame.ButtonArea
	
	if self._buttonCount == 0 then
		ButtonArea.Visible = false
		
		return
	else
		ButtonArea.Visible = true
		ButtonArea.ButtonLayout.CellSize = UDim2.new(0, (self._frame.Size.X.Offset - (self._buttonCount - 1) * Constants.BUTTON_CELL_PADDING - 2 * Constants.SIDE_PADDING) / self._buttonCount, 0, Constants.BUTTON_HEIGHT)
	end
end

function ErrorPromptModule:clearButtons()
	local ButtonArea = self._frame.MessageArea.ErrorFrame.ButtonArea
	
	if self._primaryShimmer then
		self._primaryShimmer = nil
	end
	for _, child in pairs((ButtonArea:GetChildren())) do
		if child.name ~= "ButtonLayout" then
			child:Destroy()
		end
	end
end

function ErrorPromptModule:updateButtons(Frames, p1: string)
	-- upvalues: NewResult (copy), config1 (copy), ShimmerModule (copy)
	if not Frames then
		Frames = {}
	end
	if not p1 then
		p1 = "Default"
	end
	self:clearButtons()
	local ButtonArea = self._frame.MessageArea.ErrorFrame.ButtonArea
	local _buttonCount = 0
	
	for _, frame in pairs(Frames) do
		local Text = frame.Text
		
		if frame.LocalizationKey then
			local LocalizationKey = frame.LocalizationKey
			local Text1 = frame.Text
			local v1 = nil
			local Success, Result = pcall(function()
				-- upvalues: NewResult (upval), LocalizationKey (copy), v1 (copy)
				return NewResult:Format(LocalizationKey, v1)
			end)
			Text = Success and Result or Text1
		end
		local v2 = config1[p1](Text, frame.LayoutOrder, frame.Primary)
		
		if frame.Primary then
			self._primaryShimmer = ShimmerModule.new(v2, "PrimaryButton")
		end
		v2.Parent = ButtonArea
		v2.Activated:connect(frame.Callback)
		_buttonCount += 1
	end
	if self._buttonCount ~= _buttonCount then
		self._buttonCount = _buttonCount
		self:_relayout()
	end
end

function ErrorPromptModule:primaryShimmerPlay()
	if self._primaryShimmer then
		self._primaryShimmer:play()
	end
end

function ErrorPromptModule:primaryShimmerStop()
	if self._primaryShimmer then
		self._primaryShimmer:stop()
	end
end

function ErrorPromptModule:resizeWidthAndHeight(p2, p3)
	self:_resizeWidth(p2)
	self:_resizeHeight(p3)
	self:_relayout()
end

function ErrorPromptModule:_resizeWidth(p2)
	-- upvalues: Constants (copy)
	local Offset = self._frame.Size.X.Offset
	local XOffset = p2 - 2 * Constants.SIDE_MARGIN
	
	if Constants.ERROR_PROMPT_MAX_WIDTH.Default < XOffset then
		if Offset == Constants.ERROR_PROMPT_MAX_WIDTH.Default then return end
		XOffset = Constants.ERROR_PROMPT_MAX_WIDTH.Default
	end
	if XOffset < Constants.ERROR_PROMPT_MIN_WIDTH.Default then
		if Offset == Constants.ERROR_PROMPT_MIN_WIDTH.Default then return end
		XOffset = Constants.ERROR_PROMPT_MIN_WIDTH.Default
	end
	self._frame.Size = UDim2.new(0, XOffset, 0, self._frame.Size.Y.Offset)
end

function ErrorPromptModule:_resizeHeight(Y)
	-- upvalues: Constants (copy), TextService (copy)
	local ErrorMessage = self._frame.MessageArea.ErrorFrame.ErrorMessage
	self._frame.Size = UDim2.new(0, self._frame.Size.X.Offset, 0, (math.max(math.min(Constants.ERROR_TITLE_FRAME_HEIGHT.Default + TextService:GetTextSize(ErrorMessage.Text, ErrorMessage.TextSize, ErrorMessage.Font, (Vector2.new(self._frame.Size.X.Offset - 2 * Constants.SIDE_PADDING, 1000))).Y + Constants.SPLIT_LINE_THICKNESS + Constants.BUTTON_HEIGHT + Constants.LAYOUT_PADDING + 2 * Constants.SIDE_PADDING + 1, Y - 2 * Constants.VERTICAL_MARGIN), Constants.ERROR_PROMPT_MIN_HEIGHT.Default)))
end

return ErrorPromptModule