local _ = require("./types")
local CoreModule = require("../vendor/compose/core")
local MotionModule = require("./motion")
local MediaMemoModule = require("./media_memo")

return function(p1, Object, p2)
	-- upvalues: MotionModule (copy), CoreModule (copy), MediaMemoModule (copy)
	local Compose = p1.Compose
	local ReducedResult = MotionModule.reduced(p1)
	local v1 = assert(Compose.currentOwner())
	local v2 = nil
	local v3 = nil
	local BackgroundTransparency = Object.BackgroundTransparency
	local BackgroundColor3 = Object.BackgroundColor3
	
	local function locate()
		-- upvalues: Object (copy), v3 (ref), CoreModule (upval), v1 (copy), v2 (ref), p1 (copy), p2 (copy), BackgroundTransparency (copy), BackgroundColor3 (copy), Compose (copy), MediaMemoModule (upval), ReducedResult (copy)
		local Parent = Object.Parent
		local Object1 = nil
		local v4 = nil
		while Parent do
			if Parent:IsA("GuiObject") and Parent:HasTag("facet-panel") and v4 == nil then
				v4 = Parent
			end
			if not Parent:GetAttribute("FacetCollectionRow") then
				Parent = Parent.Parent
				continue
			end
			Object1 = Parent
			break
		end
		if Object1 == v3 or CoreModule.owner.isDisposed(v1) then return end
		if v2 then
			CoreModule.owner.dispose(v2)
			v2 = nil
		end
		v3 = Object1
		
		if Object1 then
			local Child = CoreModule.owner.createChild(v1)
			v2 = Child
			Compose.withOwner(Child, function()
				-- upvalues: p1 (upval), Object (upval), Compose (upval), MediaMemoModule (upval), CoreModule (upval), Object1 (ref), ReducedResult (upval), v4 (ref), p2 (upval), BackgroundTransparency (upval), BackgroundColor3 (upval)
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(Object)
				local IsLoaded = if Object:IsA("ImageLabel") then p1.observe.IsLoaded(Object) else nil
				local ImageResult = if Object:IsA("ImageLabel") then p1.observe.Image(Object) else nil
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: ImageResult (copy), Compose (upval), Object (upval), MediaMemoModule (upval), p1 (upval), IsLoaded (copy), CoreModule (upval), AbsoluteSizeResult (copy), Object1 (upval), ReducedResult (upval), v4 (upval), p2 (upval), BackgroundTransparency (upval), BackgroundColor3 (upval)
					if ImageResult then
						Callback(ImageResult)
					end
					local v5 = assert(Compose.currentOwner())
					local Image = if Object:IsA("ImageLabel") then Object.Image else ""
					local ProbeResult = MediaMemoModule.probe(p1, Image)
					local ProbeResult1 = ProbeResult or MediaMemoModule.knows(p1, Image)
					local CellResult = Compose.cell(ProbeResult1)
					local ContentProvider = p1.config.services and p1.config.services.ContentProvider
					
					if IsLoaded and Image ~= "" then
						local Inverted = not IsLoaded:peek()
						Compose.watch(function(Callback)
							-- upvalues: IsLoaded (copy), Inverted (ref), Object (upval), Image (copy), MediaMemoModule (upval), p1 (upval)
							if not Callback(IsLoaded) then
								Inverted = true
								
								return
							end
							if Inverted and Object.Image == Image then
								MediaMemoModule.remember(p1, Image)
							end
						end)
					end
					if ContentProvider and Object:IsA("ImageLabel") and Image ~= "" and not ProbeResult and task then
						local DeferredThread = task.defer(function()
							-- upvalues: ContentProvider (copy), Object (upval), CoreModule (upval), v5 (copy), Image (copy), MediaMemoModule (upval), p1 (upval), CellResult (copy)
							pcall(function()
								-- upvalues: ContentProvider (upval), Object (upval), CoreModule (upval), v5 (upval), Image (upval), MediaMemoModule (upval), p1 (upval), CellResult (upval)
								ContentProvider:PreloadAsync({ Object }, function(_, Success)
									-- upvalues: CoreModule (upval), v5 (upval), Object (upval), Image (upval), MediaMemoModule (upval), p1 (upval), CellResult (upval)
									if not CoreModule.owner.isDisposed(v5) and Object.Image == Image then
										MediaMemoModule.settle(p1, Image, Success)
										CellResult:set(Success == p1.types.Enum.AssetFetchStatus.Success)
										
										return
									end
								end)
							end)
						end)
						Compose.cleanup(function()
							-- upvalues: DeferredThread (copy)
							if coroutine.status(DeferredThread) ~= "dead" then
								task.cancel(DeferredThread)
							end
						end)
					end
					local function available()
						-- upvalues: AbsoluteSizeResult (upval), Object (upval), IsLoaded (upval), ImageResult (upval), CellResult (copy)
						local PeekResult = AbsoluteSizeResult:peek()
						
						return PeekResult.X > 0 and PeekResult.Y > 0 and (Object:GetAttribute("FacetBuilt") ~= false and (IsLoaded == nil or ((if ImageResult == nil then IsLoaded:peek() == true else ImageResult:peek() == "" or IsLoaded:peek() == true) or CellResult:peek())))
					end
					
					local FormulaResult = if Object:IsA("ImageLabel") then if CellResult:peek() or Object.Image == "" or Object1:IsA("CanvasGroup") and Object1.GroupTransparency == 1 then Compose.formula(function(Callback: (any) -> ())
						-- upvalues: AbsoluteSizeResult (upval), IsLoaded (upval), ImageResult (upval), CellResult (copy), available (copy)
						Callback(AbsoluteSizeResult)
						Callback(assert(IsLoaded))
						Callback(assert(ImageResult))
						Callback(CellResult)
						
						return (available())
					end) elseif Object1:GetAttribute("FacetCollectionReady") == false then Compose.formula(function(Callback: (any) -> ())
						-- upvalues: AbsoluteSizeResult (upval), IsLoaded (upval), ImageResult (upval), CellResult (copy), available (copy)
						Callback(AbsoluteSizeResult)
						Callback(assert(IsLoaded))
						Callback(assert(ImageResult))
						Callback(CellResult)
						
						return (available())
					end) else p1.runtime.settled({
						sample = function(): string
							-- upvalues: AbsoluteSizeResult (upval)
							return (tostring(AbsoluteSizeResult:peek()))
						end,
						ready = available,
						restart = function(Callback): string
							-- upvalues: ImageResult (upval), AbsoluteSizeResult (upval)
							return if ImageResult then tostring(Callback(ImageResult)) else tostring(Callback(AbsoluteSizeResult))
						end
					}) else p1.runtime.settled({
						sample = function(): string
							-- upvalues: AbsoluteSizeResult (upval)
							return (tostring(AbsoluteSizeResult:peek()))
						end,
						ready = available,
						restart = function(Callback): string
							-- upvalues: ImageResult (upval), AbsoluteSizeResult (upval)
							return if ImageResult then tostring(Callback(ImageResult)) else tostring(Callback(AbsoluteSizeResult))
						end
					})
					Compose.watch(function(Callback)
						-- upvalues: Object (upval), FormulaResult (copy)
						Object:SetAttribute("FacetMediaReady", Callback(FormulaResult))
					end)
					local TweenResult = p1.runtime.tween(function(Callback): number
						-- upvalues: FormulaResult (copy)
						return if Callback(FormulaResult) then 1 else 0
					end, {
						seconds = function(p3)
							-- upvalues: p1 (upval)
							return p1.motionTiming("reveal", p3).enter
						end,
						ease = p1.motionEase("fade"),
						reducedMotion = function(p3)
							-- upvalues: ReducedResult (upval), ProbeResult1 (copy), Object1 (upval)
							return ReducedResult(p3) or (ProbeResult1 or (Object1:IsA("CanvasGroup") and Object1.GroupTransparency == 1 or Object1:GetAttribute("FacetCollectionReady") == false))
						end
					})
					local V14 = v4 or Object1
					assert(V14:IsA("GuiObject"))
					local BackgroundColor3Result = p1.observeStyled.BackgroundColor3(V14)
					p1.runtime.decorate(Object, {
						ImageTransparency = function(Callback): number
							-- upvalues: p1 (upval), p2 (upval), TweenResult (copy)
							return 1 - (1 - (p1.read(p2, Callback) or 0)) * Callback(TweenResult)
						end,
						BackgroundTransparency = if Object:IsA("ViewportFrame") then nil else function(Callback)
							-- upvalues: BackgroundTransparency (upval), TweenResult (copy)
							return BackgroundTransparency * Callback(TweenResult)
						end,
						BackgroundColor3 = if Object:IsA("ViewportFrame") then nil else function(Callback)
							-- upvalues: TweenResult (copy), BackgroundColor3 (upval), BackgroundColor3Result (copy), BackgroundTransparency (upval)
							local CallbackResult: number = Callback(TweenResult)
							local CallbackResult1 = Callback(BackgroundColor3Result)
							
							return if BackgroundTransparency >= 1 then if CallbackResult < 1 then CallbackResult1 else BackgroundColor3 else CallbackResult1:Lerp(BackgroundColor3, CallbackResult)
						end
					})
				end)
			end)
			
			return
		end
		Object.ImageTransparency = p1.read(p2) or 0
		
		if not Object:IsA("ViewportFrame") then
			Object.BackgroundTransparency = BackgroundTransparency
			Object.BackgroundColor3 = BackgroundColor3
		end
		Object:SetAttribute("FacetMediaReady", nil)
	end
	
	p1.runtime.connect(Object, "AncestryChanged", locate)
	locate()
end