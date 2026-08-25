local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local tweenService = game:GetService("TweenService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local textService = game:GetService("TextService")
local guiService = game:GetService("GuiService")
local localizationService = game:GetService("LocalizationService")
local VRService = game:GetService("VRService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local constants = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants
local shimmerModule = require(robloxGui.Modules.Shimmer)
local getFFlagDisplayChannelNameOnErrorPromptModule = require(robloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizeErrorCodeStringFFlag = settings():GetFFlag("LocalizeErrorCodeString")
local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0)
local var15 = localization.new(localizationService.RobloxLocaleId)

local function _(p0, p1, p2)
	-- upvalues: var15 (ref)
	local ok, status = pcall(function()
		-- upvalues: var15 (copy), p0 (ref), p2 (ref)
		return var15:Format(p0, p2)
	end)
	
	return if ok then status else p1
end

local t = {
	Default = function()
		-- upvalues: create (ref), constants (ref)
		return create("Frame")({
			Name = "ErrorPrompt",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = constants.COLORS.FLINT,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, constants.ERROR_PROMPT_MAX_WIDTH.Default, 0, constants.ERROR_PROMPT_HEIGHT.Default),
			Visible = false,
			AutoLocalize = false,
			ZIndex = 8,
			create("UIListLayout")({
				Name = "PromptLayout",
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			create("UIScale")({ Name = "PromptScale", Scale = 0 }),
			create("Frame")({
				Name = "TitleFrame",
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, constants.ERROR_TITLE_FRAME_HEIGHT.Default),
				BorderSizePixel = 0,
				ZIndex = 8,
				create("UIPadding")({
					Name = "TitleFramePadding",
					PaddingBottom = UDim.new(0, 11),
					PaddingTop = UDim.new(0, 11)
				}),
				create("TextLabel")({
					Name = "ErrorTitle",
					TextSize = 25,
					BackgroundTransparency = 1,
					ZIndex = 8,
					TextColor3 = constants.COLORS.WHITE,
					Size = UDim2.new(1, 0, 0, 28),
					Font = Enum.Font.SourceSansSemibold,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			}),
			create("Frame")({
				Name = "SplitLine",
				LayoutOrder = 2,
				BorderSizePixel = 0,
				ZIndex = 8,
				Size = UDim2.new(1, -2 * constants.SIDE_PADDING, 0, constants.SPLIT_LINE_THICKNESS),
				BackgroundColor3 = constants.COLORS.PUMICE
			}),
			create("Frame")({
				Name = "MessageArea",
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, (-constants.ERROR_TITLE_FRAME_HEIGHT.Default) - constants.SPLIT_LINE_THICKNESS),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 8,
				create("UIPadding")({
					Name = "MessageAreaPadding",
					PaddingBottom = UDim.new(0, constants.SIDE_PADDING),
					PaddingLeft = UDim.new(0, constants.SIDE_PADDING),
					PaddingRight = UDim.new(0, constants.SIDE_PADDING),
					PaddingTop = UDim.new(0, constants.SIDE_PADDING)
				}),
				create("Frame")({
					Name = "ErrorFrame",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 8,
					create("UIListLayout")({
						Name = "ErrorFrameLayout",
						Padding = UDim.new(0, constants.LAYOUT_PADDING),
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					create("TextLabel")({
						Name = "ErrorMessage",
						LayoutOrder = 1,
						TextSize = 20,
						ZIndex = 8,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, (-constants.BUTTON_HEIGHT) - constants.LAYOUT_PADDING),
						TextColor3 = constants.COLORS.PUMICE,
						Font = Enum.Font.SourceSans
					}),
					create("Frame")({
						Name = "ButtonArea",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, constants.BUTTON_HEIGHT),
						ZIndex = 8,
						LayoutOrder = 2,
						SelectionGroup = true,
						SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
						SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
						SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
						SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
						create("UIGridLayout")({
							Name = "ButtonLayout",
							CellPadding = UDim2.new(0, constants.BUTTON_CELL_PADDING, 0, 0),
							CellSize = UDim2.new(1, 0, 0, constants.BUTTON_HEIGHT),
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
local t_1 = {
	Default = function(p3, p4, p5)
		-- upvalues: create (ref), constants (ref)
		return create("ImageButton")({
			Name = p3 .. "Button",
			BackgroundTransparency = 1,
			ImageColor3 = if p5 then constants.COLORS.WHITE else constants.COLORS.PUMICE,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Image = if p5 then constants.PRIMARY_BUTTON_TEXTURE else constants.SECONDARY_BUTTON_TEXTURE,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			LayoutOrder = p4,
			ZIndex = 8,
			create("TextLabel")({
				Name = "ButtonText",
				BackgroundTransparency = 1,
				TextSize = 20,
				ZIndex = 8,
				Text = p3,
				Size = UDim2.new(1, 0, 1, 0),
				TextColor3 = if p5 then constants.COLORS.SLATE else constants.COLORS.PUMICE,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = Enum.Font.SourceSans
			})
		})
	end
}
local t_2 = {}
t_2.__index = t_2

function t_2.new(p6, p7)
	-- upvalues: t_2 (ref), t (ref), tweenService (ref), tweenInfo (ref), VRService (ref), userInputService (ref), guiService (ref)
	local tbl = setmetatable({}, t_2)
	tbl._frame = p6 and t[p6]() or t.Default()
	tbl._isOpen = false
	tbl._openAnimation = tweenService:Create(tbl._frame.PromptScale, tweenInfo, { Scale = 1 })
	tbl._closeAnimation = tweenService:Create(tbl._frame.PromptScale, tweenInfo, { Scale = 0 })
	tbl._buttonCount = 0
	tbl._playAnimation = true
	tbl._hideErrorCode = false
	tbl._menuIsOpenKey = "ErrorPrompt"
	
	if p7 then
		if p7.PlayAnimation ~= nil then
			tbl._playAnimation = p7.PlayAnimation
		end
		if p7.HideErrorCode ~= nil then
			tbl._hideErrorCode = p7.HideErrorCode
		end
		if p7.MenuIsOpenKey ~= nil then
			tbl._menuIsOpenKey = p7.MenuIsOpenKey
		end
		tbl._frame.MessageArea.ErrorFrame.ErrorMessage.TextScaled = p7.MessageTextScaled or false
	end
	if not VRService.VREnabled and userInputService.GamepadEnabled then
		guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: tbl (ref), guiService (copy)
			if tbl._isOpen and guiService.SelectedCoreObject == nil then
				guiService:Select(tbl._frame.MessageArea.ErrorFrame.ButtonArea)
			end
		end)
	end
	return tbl
end

local function sinkInput(_, _, _)
	return Enum.ContextActionResult.Sink
end

function t_2:_open(p8, p9, p10)
	-- upvalues: robloxGui (ref), mouseIconOverrideService (ref), guiService (ref), VRService (ref), userInputService (ref), contextActionService (ref), sinkInput (ref)
	self:setErrorText(p8, p9, p10)
	self:_resizeHeight(robloxGui.AbsoluteSize.Y)
	
	if not self._isOpen then
		mouseIconOverrideService.push("ErrorPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		guiService:SetMenuIsOpen(true, self._menuIsOpenKey)
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
	if self._isOpen and (VRService.VREnabled or userInputService.PreferredInput == Enum.PreferredInput.Gamepad) then
		guiService:Select(self._frame.MessageArea.ErrorFrame.ButtonArea)
	end
	contextActionService:BindCoreAction("ErrorPromptAction", sinkInput, false, Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonStart)
end

function t_2:_close()
	-- upvalues: mouseIconOverrideService (ref), guiService (ref), contextActionService (ref)
	if self._isOpen then
		mouseIconOverrideService.pop("ErrorPromptOverride")
		guiService:SetMenuIsOpen(false, self._menuIsOpenKey)
		self._isOpen = false
		
		if self._playAnimation then
			self._closeAnimation:Play()
			self._closeAnimation.Completed:wait()
		else
			self._frame.PromptScale.Scale = 0
		end
		self._frame.Visible = false
		contextActionService:UnbindCoreAction("ErrorPromptAction")
	end
end

function t_2:setParent(p11)
	self._frame.Parent = p11
end

function t_2:setErrorText(p12, p13, p14)
	-- upvalues: runService (ref), localizeErrorCodeStringFFlag (ref), var15 (ref), getFFlagDisplayChannelNameOnErrorPromptModule (ref)
	local errorMessage = self._frame.MessageArea.ErrorFrame.ErrorMessage
	local robloxClientChannel = runService:GetRobloxClientChannel()
	
	if self._hideErrorCode then
		errorMessage.Text = p12
		
		return
	elseif localizeErrorCodeStringFFlag then
		local var22 = if p13 then p13.Value else -1
		local var23 = ("Error Code: %d"):format(var22)
		local t = { ERROR_CODE = tostring(var22) }
		local var25 = "InGame.ConnectionError.Message.ErrorCode"
		local ok, status = pcall(function()
			-- upvalues: var15 (copy), var25 (ref), t (ref)
			return var15:Format(var25, t)
		end)
		local var26 = if ok then status else var23
		local var27 = nil
		
		if getFFlagDisplayChannelNameOnErrorPromptModule() and p14 and robloxClientChannel then
			var27 = ("%s\n(%s, %s)"):format(p12, var26, var15:Format("InGame.ConnectionError.Message.ChannelName", { CHANNEL_NAME = robloxClientChannel }) or ("Channel: %s"):format(robloxClientChannel))
		end
		errorMessage.Text = var27 or ("%s\n(%s)"):format(p12, var26)
		
		return
	elseif p13 then
		errorMessage.Text = ("%s\n(Error Code: %d)"):format(p12, p13.Value)
		
		return
	end
	errorMessage.Text = ("%s\n(Error Code: -1)"):format(p12)
end

function t_2:setErrorTitle(p15, p16)
	-- upvalues: var15 (ref)
	if not p15 then return end
	local errorTitle = self._frame.TitleFrame.ErrorTitle
	
	if p16 then
		local var28 = nil
		local ok, status = pcall(function()
			-- upvalues: var15 (copy), p16 (ref), var28 (ref)
			return var15:Format(p16, var28)
		end)
		errorTitle.Text = if ok then status else p15
		
		return
	end
	errorTitle.Text = p15
end

function t_2:onErrorChanged(p17, p18, p19)
	if p17 == "" then
		self:_close()
		
		return
	elseif p17 ~= "" then
		self:_open(p17, p18, p19)
	end
end

function t_2:_relayout()
	-- upvalues: constants (ref)
	local buttonArea = self._frame.MessageArea.ErrorFrame.ButtonArea
	
	if self._buttonCount == 0 then
		buttonArea.Visible = false
		
		return
	end
	local var29 = (self._frame.Size.X.Offset - (self._buttonCount - 1) * constants.BUTTON_CELL_PADDING - 2 * constants.SIDE_PADDING) / self._buttonCount
	buttonArea.Visible = true
	buttonArea.ButtonLayout.CellSize = UDim2.new(0, var29, 0, constants.BUTTON_HEIGHT)
end

function t_2:clearButtons()
	local buttonArea = self._frame.MessageArea.ErrorFrame.ButtonArea
	
	if self._primaryShimmer then
		self._primaryShimmer = nil
	end
	for i, v in pairs(buttonArea:GetChildren()) do
		if v.name ~= "ButtonLayout" then
			v:Destroy()
		end
	end
end

function t_2:updateButtons(p20, p21)
	-- upvalues: var15 (ref), t_1 (ref), shimmerModule (ref)
	if not p20 then
		p20 = {}
	end
	if not p21 then
		p21 = "Default"
	end
	self:clearButtons()
	local buttonArea = self._frame.MessageArea.ErrorFrame.ButtonArea
	local var30 = 0
	
	for i, v in pairs(p20) do
		local text = v.Text
		
		if v.LocalizationKey then
			local localizationKey = v.LocalizationKey
			local text_1 = v.Text
			local var31 = nil
			local ok, status = pcall(function()
				-- upvalues: var15 (copy), localizationKey (ref), var31 (ref)
				return var15:Format(localizationKey, var31)
			end)
			text = if ok then status else text_1
		end
		local var32 = t_1[p21](text, v.LayoutOrder, v.Primary)
		
		if v.Primary then
			self._primaryShimmer = shimmerModule.new(var32, "PrimaryButton")
		end
		var32.Parent = buttonArea
		var32.Activated:connect(v.Callback)
		var30 += 1
	end
	if self._buttonCount ~= var30 then
		self._buttonCount = var30
		self:_relayout()
	end
end

function t_2:primaryShimmerPlay()
	if self._primaryShimmer then
		self._primaryShimmer:play()
	end
end

function t_2:primaryShimmerStop()
	if self._primaryShimmer then
		self._primaryShimmer:stop()
	end
end

function t_2:resizeWidthAndHeight(p22, p23)
	self:_resizeWidth(p22)
	self:_resizeHeight(p23)
	self:_relayout()
end

function t_2:_resizeWidth(p24)
	-- upvalues: constants (ref)
	local offset = self._frame.Size.X.Offset
	local var33 = p24 - 2 * constants.SIDE_MARGIN
	
	if constants.ERROR_PROMPT_MAX_WIDTH.Default < var33 then
		if offset == constants.ERROR_PROMPT_MAX_WIDTH.Default then return end
		var33 = constants.ERROR_PROMPT_MAX_WIDTH.Default
	end
	if var33 < constants.ERROR_PROMPT_MIN_WIDTH.Default then
		if offset == constants.ERROR_PROMPT_MIN_WIDTH.Default then return end
		var33 = constants.ERROR_PROMPT_MIN_WIDTH.Default
	end
	self._frame.Size = UDim2.new(0, var33, 0, self._frame.Size.Y.Offset)
end

function t_2:_resizeHeight(p25)
	-- upvalues: constants (ref), textService (ref)
	local errorMessage = self._frame.MessageArea.ErrorFrame.ErrorMessage
	self._frame.Size = UDim2.new(0, self._frame.Size.X.Offset, 0, math.max(math.min(constants.ERROR_TITLE_FRAME_HEIGHT.Default + textService:GetTextSize(errorMessage.Text, errorMessage.TextSize, errorMessage.Font, Vector2.new(self._frame.Size.X.Offset - 2 * constants.SIDE_PADDING, 1000)).Y + constants.SPLIT_LINE_THICKNESS + constants.BUTTON_HEIGHT + constants.LAYOUT_PADDING + 2 * constants.SIDE_PADDING + 1, p25 - 2 * constants.VERTICAL_MARGIN), constants.ERROR_PROMPT_MIN_HEIGHT.Default))
end

return t_2