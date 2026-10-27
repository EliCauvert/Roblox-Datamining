local ContentProvider = game:GetService("ContentProvider")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FoundationModule = require(Parent.Foundation)
local FFlagMomentsImageWithSkeletonRetryModule = require(Moments.Flags.FFlagMomentsImageWithSkeletonRetry)
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { frequency = 3, dampingRatio = 1 }

local function _(Circle, p1): UDim
	-- upvalues: Radius (copy)
	return if Circle == Radius.Circle then UDim.new(1, 0) else UDim.new(0, p1.Radius[Circle])
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), Radius (copy), ReactModule (copy), ReactOtterModule (copy), ContentProvider (copy), config (copy), FFlagMomentsImageWithSkeletonRetryModule (copy), View (copy), Image (copy), Skeleton (copy)
	local UseTokensResult = UseTokensFunction()
	local Radius1 = Frame.radius or Radius.Medium
	local Image1 = Frame.Image
	local IsNotImageMatch: boolean = Image1 ~= nil and Image1 ~= ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsNotImageMatch)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: Image1 (copy), ContentProvider (upval), UseStateResult2 (copy)
		if Image1 ~= nil and ContentProvider:GetAssetFetchStatus(Image1) == Enum.AssetFetchStatus.Success then
			UseStateResult2(false)
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), IsNotImageMatch (copy), Image1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), ContentProvider (upval), FFlagMomentsImageWithSkeletonRetryModule (upval)
		UseStateResult2(IsNotImageMatch)
		
		if not IsNotImageMatch or Image1 == nil or Image1 == "" then
			UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
			
			return
		end
		local Flag = true
		
		local function fadeInImage()
			-- upvalues: Flag (ref), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
			if Flag then
				UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
			end
		end
		
		if ContentProvider:GetAssetFetchStatus(Image1) == Enum.AssetFetchStatus.Success then
			if Flag then
				UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
			end
			return function()
				-- upvalues: Flag (ref)
				Flag = false
			end
		else
			UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
			
			if FFlagMomentsImageWithSkeletonRetryModule then
				task.spawn(require(script.Parent.preloadImageWithRetry), Image1, {
					isCurrent = function()
						-- upvalues: Flag (ref)
						return Flag
					end,
					onSuccess = fadeInImage,
					onGiveUp = function()
						-- upvalues: UseStateResult2 (upval)
						UseStateResult2(false)
					end
				})
				
				return function()
					-- upvalues: Flag (ref)
					Flag = false
				end
			else
				task.spawn(function()
					-- upvalues: ContentProvider (upval), Image1 (upval), Flag (ref), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
					pcall(function()
						-- upvalues: ContentProvider (upval), Image1 (upval), Flag (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
						ContentProvider:PreloadAsync({ Image1 }, function(Image, AssetFetchStatus)
							-- upvalues: Image1 (upval), Flag (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
							if Image == Image1 and AssetFetchStatus == Enum.AssetFetchStatus.Success and Flag then
								UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
							end
						end)
					end)
					
					if ContentProvider:GetAssetFetchStatus(Image1) == Enum.AssetFetchStatus.Success and Flag then
						UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
					end
				end)
				
				return function()
					-- upvalues: Flag (ref)
					Flag = false
				end
			end
		end
	end, { Image1, IsNotImageMatch })
	local ImageStyle = Frame.imageStyle
	local UseAnimatedBindingResult1 = if ImageStyle == nil then UseAnimatedBindingResult else ReactModule.joinBindings({ UseAnimatedBindingResult, ImageStyle }):map(function(Entry): number
		return 1 - (1 - Entry[1]) * (1 - (Entry[2].Transparency or 0))
	end)
	
	return ReactModule.createElement(View, { LayoutOrder = Frame.LayoutOrder, Size = Frame.Size }, {
		Image = ReactModule.createElement(Image, {
			tag = "size-full",
			Image = Image1,
			backgroundStyle = Frame.backgroundStyle,
			imageStyle = if IsNotImageMatch and ImageStyle ~= nil then ReactModule.joinBindings({ ImageStyle, UseAnimatedBindingResult }):map(function(Entry)
				local Entry1 = Entry[1]
				
				return {
					Color3 = Entry1.Color3,
					Transparency = 1 - (1 - Entry1.Transparency) * Entry[2]
				}
			end) elseif IsNotImageMatch then UseAnimatedBindingResult:map(function(p1: number)
				return { Color3 = Color3.new(1, 1, 1), Transparency = 1 - p1 }
			end) else ImageStyle,
			cornerRadius = if Radius1 == Radius.Circle then UDim.new(1, 0) else UDim.new(0, UseTokensResult.Radius[Radius1]),
			ScaleType = Frame.ScaleType or Enum.ScaleType.Crop
		}),
		SkeletonOverlay = if IsNotImageMatch and UseStateResult then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 2,
			GroupTransparency = UseAnimatedBindingResult1
		}, {
			Shimmer = ReactModule.createElement(Skeleton, { radius = Radius1, Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end)