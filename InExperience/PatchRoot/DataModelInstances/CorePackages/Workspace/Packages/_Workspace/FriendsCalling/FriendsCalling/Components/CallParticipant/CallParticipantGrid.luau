local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CallParticipantCardModule = require(script.Parent.CallParticipantCard)
local ResolveGridLayoutModule = require(script.Parent.resolveGridLayout)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function useContainerSize()
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local function update()
			-- upvalues: UseStateResult2 (upval), Current (copy)
			UseStateResult2(Current.AbsoluteSize)
		end
		
		UseStateResult2(Current.AbsoluteSize)
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseRefResult, UseStateResult
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), useContainerSize (copy), ResolveGridLayoutModule (copy), ReactModule (copy), View (copy), CallParticipantCardModule (copy)
	local Medium = UseTokensFunction().Gap.Medium
	local UseContainerSizeResult, UseContainerSizeResult2 = useContainerSize()
	local ResolveGridLayoutModuleResult = ResolveGridLayoutModule(UseContainerSizeResult2, #p1.participants, Medium)
	local Elements = {}
	
	for i = 1, ResolveGridLayoutModuleResult.rows do
		local Elements1 = {}
		
		for i1 = 1, ResolveGridLayoutModuleResult.columns do
			local NewI = (i - 1) * ResolveGridLayoutModuleResult.columns + i1
			local Participant = p1.participants[NewI]
			
			if Participant == nil then break end
			Elements1[`Participant{NewI}`] = ReactModule.createElement(View, {
				LayoutOrder = i1,
				Size = UDim2.fromOffset(ResolveGridLayoutModuleResult.cardSize.X, ResolveGridLayoutModuleResult.cardSize.Y)
			}, {
				Card = ReactModule.createElement(CallParticipantCardModule, {
					userId = Participant.userId,
					name = Participant.name,
					statusText = Participant.statusText,
					isMuted = Participant.isMuted,
					isSpeaking = Participant.isSpeaking,
					isDimmed = Participant.isDimmed,
					showStatusAnimation = Participant.showStatusAnimation
				})
			})
		end
		Elements[`Row{i}`] = ReactModule.createElement(View, {
			tag = "row align-x-center gap-medium size-full-0 auto-y",
			LayoutOrder = i
		}, Elements1)
	end
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center gap-medium size-full",
		ref = UseContainerSizeResult,
		testId = p1.testId
	}, Elements)
end