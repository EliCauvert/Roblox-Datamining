local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ReactOtterModule = require(Parent1.ReactOtter)
local _ = require(script.Parent.GalleryButtonContentView)
local _ = require(Parent.Types)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { dampingRatio = 1, frequency = 4 }

local function _(p1): number
	return if p1 == 1 then 2 else 1
end

local _ = function(p1, p2)
	return if p2 == 1 then p1.thumbnail1 else p1.thumbnail2
end

local _ = function(p1)
	-- upvalues: ReactOtterModule (copy), config (copy)
	return ReactOtterModule.spring(if p1 then 1 else 0, config)
end

local function createThumbnailBindings(p1, p2)
	return {
		style = p1:map(function(p3)
			-- upvalues: p2 (copy)
			return {
				Color3 = Color3.new(1, 1, 1),
				Transparency = 1 - math.clamp(if p2 == 1 then p3.thumbnail1 else p3.thumbnail2, 0, 1)
			}
		end),
		scale = p1:map(function(p3): number
			-- upvalues: p2 (copy)
			return (math.lerp(0.5, 1, (math.clamp(if p2 == 1 then p3.thumbnail1 else p3.thumbnail2, 0, 1))))
		end)
	}
end

return function(Current)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), createThumbnailBindings (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({ [1] = Current })
	local UseRefResult = ReactModule.useRef(1)
	local UseRefResult1 = ReactModule.useRef(Current)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding({
		thumbnail2 = 0,
		icon = if Current then 1 else 0,
		thumbnail1 = if Current then 1 else 0
	}, (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), Current (copy), UseStateResult (copy)
		UseStateResult2_1(function(p1)
			-- upvalues: Current (upval), UseStateResult (upval)
			return if Current then { [UseStateResult] = p1[UseStateResult] } else {}
		end)
	end, { Current, UseStateResult })))
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), Current (copy), UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		local Current1 = UseRefResult1.current
		UseRefResult1.current = Current
		
		if Current1 == Current then return end
		local Current2 = UseRefResult.current
		
		if Current1 and Current then
			Current2 = if Current2 == 1 then 2 else 1
			UseRefResult.current = Current2
		end
		if Current then
			UseStateResult2_1(function(Tbl)
				-- upvalues: Current2 (ref), Current (upval)
				local Copy = table.clone(Tbl)
				Copy[Current2] = Current
				
				return Copy
			end)
		end
		UseStateResult2(Current2)
		local HasCurrent = Current ~= nil
		local config1 = {
			icon = ReactOtterModule.spring(if HasCurrent then 1 else 0, config),
			thumbnail1 = ReactOtterModule.spring(if IsCurrentMatch then 1 else 0, config),
			thumbnail2 = ReactOtterModule.spring(if IsCurrentMatch1 then 1 else 0, config)
		}
		local IsCurrentMatch: boolean = Current ~= nil and Current2 == 1
		local IsCurrentMatch1: boolean = Current ~= nil and Current2 == 2
		UseAnimatedBindingResult2(config1)
	end, { Current })
	local Emphasis = UseTokensResult.Color.Content.Emphasis
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseAnimatedBindingResult (copy), Emphasis (copy), createThumbnailBindings (upval)
		return {
			iconStyle = UseAnimatedBindingResult:map(function(p1)
				-- upvalues: Emphasis (upval)
				return {
					Color3 = Emphasis.Color3,
					Transparency = math.lerp(Emphasis.Transparency, 1, (math.clamp(p1.icon, 0, 1)))
				}
			end),
			iconScale = UseAnimatedBindingResult:map(function(p1): number
				return (math.lerp(1, 0.5, (math.clamp((p1.icon - 0.1) / 0.9, 0, 1))))
			end),
			thumbnails = {
				[1] = createThumbnailBindings(UseAnimatedBindingResult, 1),
				[2] = createThumbnailBindings(UseAnimatedBindingResult, 2)
			}
		}
	end, { UseAnimatedBindingResult, Emphasis })
	
	return {
		activeSlot = UseStateResult,
		slotCaptures = UseStateResult1,
		iconStyle = UseMemoResult.iconStyle,
		iconScale = UseMemoResult.iconScale,
		thumbnails = UseMemoResult.thumbnails
	}
end