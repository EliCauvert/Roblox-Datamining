local TextService = game:GetService("TextService")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetTextBoundsAsyncFunction = FoundationModule.Utility.getTextBoundsAsync
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMessageTextSizeFunction = require(Parent.ChatUIPrimitives).Utils.getMessageTextSize
local UseFinishChatWindowMessageRenderIntervalsFunction = require(Parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local _ = require(script.Parent.MessageDisplayStore.useMessageDisplayStore)
local FFlagFriendsChatMessageSendPerfTrackingModule = require(FriendsChat.Flags.FFlagFriendsChatMessageSendPerfTracking)

local function _(p1: number, p2): number --[[ Line: 55 | Named "fadeTransparency" ]]
	return p1 + p2 * (1 - p1)
end

local _ = function(p1): boolean --[[ Line: 68 | Named "isSystemDisplay" ]]
	return p1 ~= nil and p1.displayStyle == "system"
end

return ReactModule.memo(function(p1) --[[ Line: 98 | Named "FriendsChatTextMessage" ]]
	-- upvalues: FoundationModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), GetMessageTextSizeFunction (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), FFlagFriendsChatMessageSendPerfTrackingModule (copy), UseFinishChatWindowMessageRenderIntervalsFunction (copy), GetTextBoundsAsyncFunction (copy), TextService (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ChatWindowSettings = p1.chatWindowSettings
	local FontFace = (if ChatWindowSettings then ChatWindowSettings.FontFace else nil) or UseTokensResult.Typography.BodySmall.Font
	local NormalizeFontFaceResult = if FoundationFontFaceMigration then NormalizeFontFaceFunction(FontFace) elseif typeof(FontFace) == "Font" then FontFace else Font.fromEnum(FontFace)
	local _Font = Font.new(NormalizeFontFaceResult.Family, Enum.FontWeight.SemiBold, NormalizeFontFaceResult.Style)
	local MessageTextSize = GetMessageTextSizeFunction(ChatWindowSettings, p1.isSpatialUIEnabled) or UseTokensResult.Typography.BodySmall.FontSize
	local Largest = math.max(1, MessageTextSize - 2)
	local TextColor3 = if ChatWindowSettings and ChatWindowSettings.TextColor3 then ChatWindowSettings.TextColor3 else UseTokensResult.Color.Content.Default.Color3
	local MutedColor3 = UseTokensResult.Color.Content.Muted.Color3
	local TextStrokeColor3 = if ChatWindowSettings then ChatWindowSettings.TextStrokeColor3 else nil
	local TextStrokeTransparency = if ChatWindowSettings and ChatWindowSettings.TextStrokeTransparency then ChatWindowSettings.TextStrokeTransparency else 1
	local TextTransparency = p1.textTransparency or ReactModule.createBinding(0)
	local GetDisplayIdFunction = p1.getDisplayId
	local GetDisplayFromIdFunction = p1.getDisplayFromId
	local Localize = p1.localize
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 136 ]]
		-- upvalues: Largest (copy), Localize (copy)
		return { systemTextSize = Largest, localize = Localize }
	end, { Largest, Localize })
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function() --[[ Line: 139 ]]
		-- upvalues: SignalsModule (upval), GetDisplayFromIdFunction (copy), GetDisplayIdFunction (copy), UseMemoResult (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 140 ]]
			-- upvalues: GetDisplayFromIdFunction (upval), GetDisplayIdFunction (upval), UseMemoResult (upval)
			return GetDisplayFromIdFunction(GetDisplayIdFunction(p2), p2, UseMemoResult)
		end)
	end, {
		GetDisplayIdFunction,
		GetDisplayFromIdFunction,
		UseMemoResult
	})))
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(p1.getLayoutOrder)
	local GetMessageIdFromDisplayIdFunction = p1.getMessageIdFromDisplayId
	local UseFinishChatWindowMessageRenderIntervalsResult = UseFinishChatWindowMessageRenderIntervalsFunction((ReactModule.useCallback(function() --[[ Line: 150 ]]
		-- upvalues: FFlagFriendsChatMessageSendPerfTrackingModule (upval), GetMessageIdFromDisplayIdFunction (copy), GetDisplayIdFunction (copy)
		return if FFlagFriendsChatMessageSendPerfTrackingModule and GetMessageIdFromDisplayIdFunction then GetMessageIdFromDisplayIdFunction(GetDisplayIdFunction(false)) else GetDisplayIdFunction(false)
	end, { GetDisplayIdFunction, GetMessageIdFromDisplayIdFunction })))
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 158 ]]
		-- upvalues: UseFinishChatWindowMessageRenderIntervalsResult (copy)
		if p2 and p2.Text and p2.Text ~= "" then
			UseFinishChatWindowMessageRenderIntervalsResult()
		end
	end, { UseFinishChatWindowMessageRenderIntervalsResult })
	ReactModule.useEffect(function() --[[ Line: 168 ]]
		-- upvalues: FFlagFriendsChatMessageSendPerfTrackingModule (upval), UseRefResult (copy), UseFinishChatWindowMessageRenderIntervalsResult (copy)
		if not FFlagFriendsChatMessageSendPerfTrackingModule then return end
		local Current = UseRefResult.current
		
		if Current ~= nil and Current.Text ~= "" then
			UseFinishChatWindowMessageRenderIntervalsResult()
		end
	end, { UseFinishChatWindowMessageRenderIntervalsResult })
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim2 --[[ Line: 184 ]]
		-- upvalues: MessageTextSize (copy)
		return UDim2.fromOffset(math.floor(MessageTextSize * 3 / 2), MessageTextSize)
	end, { MessageTextSize })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseMemoResult1)
	ReactModule.useEffect(function() --[[ Line: 191 ]]
		-- upvalues: UseBindingResult2 (copy), UseMemoResult1 (copy)
		UseBindingResult2(UseMemoResult1)
	end, { UseMemoResult1 })
	ReactModule.useEffect(function() --[[ Line: 195 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextBoundsAsyncFunction (upval), NormalizeFontFaceResult (copy), MessageTextSize (copy), UseBindingResult2 (copy), TextService (upval)
		local Flag = false
		task.spawn(function() --[[ Line: 197 ]]
			-- upvalues: FoundationFontFaceMigration (upval), GetTextBoundsAsyncFunction (upval), NormalizeFontFaceResult (upval), MessageTextSize (upval), Flag (ref), UseBindingResult2 (upval), TextService (upval)
			if FoundationFontFaceMigration then
				local Vector = GetTextBoundsAsyncFunction("          ", NormalizeFontFaceResult, MessageTextSize)
				
				if not Flag and Vector ~= nil then
					UseBindingResult2(UDim2.fromOffset(Vector.X, Vector.Y))
					
					return
				end
				return
			else
				local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
				GetTextBoundsParams.Text = "          "
				GetTextBoundsParams.Font = NormalizeFontFaceResult
				GetTextBoundsParams.Size = MessageTextSize
				GetTextBoundsParams.Width = 1e999
				local Success, Result = pcall(function() --[[ Line: 210 ]]
					-- upvalues: TextService (upval), GetTextBoundsParams (copy)
					return TextService:GetTextBoundsAsync(GetTextBoundsParams)
				end)
				
				if not Flag and Success and Result ~= nil then
					UseBindingResult2(UDim2.fromOffset(Result.X, Result.Y))
					
					return
				end
			end
		end)
		
		return function() --[[ Line: 219 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { NormalizeFontFaceResult, MessageTextSize })
	local config = {
		font = NormalizeFontFaceResult,
		textSize = MessageTextSize,
		textColor = TextColor3
	}
	local config1 = {
		font = _Font,
		textSize = Largest,
		textColor = MutedColor3
	}
	local MapResult = UseSignalBindingResult:map(function(p2) --[[ Line: 250 ]]
		-- upvalues: config1 (copy), config (copy)
		local IsSystem: boolean = p2 ~= nil and p2.displayStyle == "system"
		
		return if IsSystem then config1 else config
	end)
	local MapResult1 = TextTransparency:map(function(p2): number --[[ Line: 266 ]]
		-- upvalues: TextStrokeTransparency (copy)
		return TextStrokeTransparency + p2 * (1 - TextStrokeTransparency)
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = UseSignalBindingResult1,
		Visible = UseSignalBindingResult:map(function(p2): boolean --[[ Line: 298 ]]
			return p2 ~= nil
		end),
		ref = p1.guiObjectRef
	}, {
		body = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			FontFace = MapResult:map(function(p2) --[[ Line: 254 ]]
				return p2.font
			end),
			TextSize = MapResult:map(function(p2) --[[ Line: 258 ]]
				return p2.textSize
			end),
			TextColor3 = MapResult:map(function(p2) --[[ Line: 262 ]]
				return p2.textColor
			end),
			TextStrokeColor3 = TextStrokeColor3,
			TextStrokeTransparency = MapResult1,
			TextTransparency = TextTransparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RichText = true,
			Text = UseSignalBindingResult:map(function(p2) --[[ Line: 224 ]]
				return if p2 == nil then "" elseif p2.skeletonWidth == "prefix" then `          {p2.content}` else p2.content
			end),
			ref = UseRefResult,
			[ReactModule.Change.Text] = UseResult
		}, {
			stroke = ReactModule.createElement("UIStroke", {
				Color = TextStrokeColor3 or Color3.fromRGB(0, 0, 0),
				Thickness = UseTokensResult.Stroke.Thin,
				Transparency = MapResult1
			})
		}),
		skeleton = ReactModule.createElement(FoundationModule.Skeleton, {
			Size = ReactModule.joinBindings({
				display = UseSignalBindingResult,
				placeholder = UseBindingResult
			}):map(function(p2) --[[ Line: 290 ]]
				local Display = p2.display
				
				return if Display == nil or Display.skeletonWidth ~= "full" then p2.placeholder else UDim2.new(1, 0, 0, p2.placeholder.Y.Offset)
			end),
			Position = UDim2.fromOffset(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Visible = ReactModule.joinBindings({
				display = UseSignalBindingResult,
				textTransparency = TextTransparency
			}):map(function(p2): boolean --[[ Line: 276 ]]
				if p2.textTransparency >= 0.9 then
					return false
				else
					local Display = p2.display
					
					return Display ~= nil and (Display.skeletonWidth == "prefix" or Display.skeletonWidth == "full")
				end
			end)
		})
	})
end)