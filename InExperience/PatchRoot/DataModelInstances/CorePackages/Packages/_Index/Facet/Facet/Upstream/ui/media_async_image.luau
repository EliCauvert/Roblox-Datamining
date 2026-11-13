local _ = require("./engine_types")
local _ = require("./types")
local _ = require("./media_types")
local _ = require("../vendor/compose/core")
local _ = require("./control_types")
local _ = require("./media_props")
local _ = require("./media_shared")
local MediaMemoModule = require("./media_memo")

return function(p1, p2, p3)
	-- upvalues: MediaMemoModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Types = p1.types
	local ReadFunction = p1.read
	local TypesEnum = Types.Enum
	local TypesUDim2 = Types.UDim2
	local BindFunction = p3.bind
	p2.AsyncImage = p1.construct("AsyncImage", function(p4)
		-- upvalues: Compose (copy), p1 (copy), TypesUDim2 (copy), ReadFunction (copy), Host (copy), BindFunction (copy), MediaMemoModule (upval), TypesEnum (copy)
		local Loading = Compose.cell("loading")
		local CellResult = Compose.cell("")
		local CellResult1 = Compose.cell(nil)
		local PropsResult = p1.props(p4, {
			"image", "source", "resource", "loader", "onStatus", "failureLabel",
			"placeholder", "dimmed", "imageProperties"
		}, {
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(48, 48)
		})
		local ImageLabelResult = Host.ImageLabel((p1.props(p4.imageProperties or {}, {}, {
			Name = "Image",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			Image = CellResult,
			ImageTransparency = function(p5): number
				-- upvalues: ReadFunction (upval), p4 (copy)
				return if ReadFunction(p4.dimmed, p5) then 0.35 else 0
			end,
			Visible = function(Callback): boolean
				-- upvalues: Loading (copy)
				return Callback(Loading) == "ready"
			end
		})))
		local ShowResults = {
			Name = "Placeholder",
			Size = TypesUDim2.fromScale(1, 1),
			BackgroundTransparency = if p4.placeholder then 1 else 0,
			Visible = function(Callback): boolean
				-- upvalues: Loading (copy)
				return Callback(Loading) ~= "ready"
			end
		}
		local PlaceholderFunction = p4.placeholder
		
		if PlaceholderFunction then
			ShowResults[#ShowResults + 1] = Compose.show(function(Callback): boolean
				-- upvalues: Loading (copy)
				return Callback(Loading) ~= "ready"
			end, function()
				-- upvalues: PlaceholderFunction (copy), Loading (copy)
				return PlaceholderFunction(Loading)
			end)
		end
		if p4.failureLabel ~= nil then
			ShowResults[#ShowResults + 1] = Compose.show(function(Callback): boolean
				-- upvalues: Loading (copy)
				return Callback(Loading) == "failed"
			end, function()
				-- upvalues: p1 (upval), BindFunction (upval), p4 (copy), TypesUDim2 (upval)
				return p1.text({
					Text = BindFunction(p4.failureLabel, ""),
					Size = TypesUDim2.fromScale(1, 1)
				})
			end)
		end
		local FrameResult = Host.Frame(ShowResults)
		PropsResult[#PropsResult + 1] = ImageLabelResult
		PropsResult[#PropsResult + 1] = if p4.placeholder then FrameResult else p1.styled(FrameResult, "skeleton")
		local FrameResult1 = Host.Frame(PropsResult)
		local Count = 0
		local Callback = nil
		Compose.cleanup(function()
			-- upvalues: Count (ref), Callback (ref)
			Count += 1
			
			if Callback then
				Callback()
			end
		end)
		
		if p4.resource then
			local ResourceResult = p4.resource()
			Compose.watch(function(p5)
				-- upvalues: Loading (copy), ReadFunction (upval), ResourceResult (copy), CellResult (copy)
				Loading:set(ReadFunction(assert(ResourceResult.state or ResourceResult.status), p5))
				CellResult:set(ReadFunction(ResourceResult.value, p5) or "")
			end)
		else
			Compose.watch(function(p5)
				-- upvalues: ReadFunction (upval), p4 (copy), Count (ref), Callback (ref), Loading (copy), CellResult1 (copy), CellResult (copy), MediaMemoModule (upval), p1 (upval), ImageLabelResult (copy), TypesEnum (upval)
				local ReadResult = ReadFunction(p4.source or p4.image, p5) or ""
				Count += 1
				local Count1: number = Count
				
				if Callback then
					Callback()
					Callback = nil
				end
				Loading:set("loading")
				CellResult1:set(nil)
				CellResult:set(ReadResult)
				
				local function resolve(p6)
					-- upvalues: Count1 (copy), Count (upval), CellResult (upval), ReadResult (copy), Loading (upval)
					if Count1 == Count then
						CellResult:set(p6 or ReadResult)
						Loading:set("ready")
					end
				end
				
				local function reject(p6)
					-- upvalues: Count1 (copy), Count (upval), CellResult1 (upval), Loading (upval)
					if Count1 == Count then
						CellResult1:set(p6)
						Loading:set("failed")
					end
				end
				
				if ReadResult ~= "" then
					if p4.loader then
						local Success, Result = pcall(p4.loader, ReadResult, resolve, reject)
						
						if Success then
							Callback = Result
							
							return
						end
						if Count1 == Count and Count1 == Count then
							CellResult1:set(Result)
							Loading:set("failed")
							
							return
						end
					elseif not MediaMemoModule.probe(p1, ReadResult) then
						if p1.config.services and p1.config.services.ContentProvider and task then
							local ContentProvider = p1.config.services.ContentProvider
							
							if MediaMemoModule.knows(p1, ReadResult) and Count1 == Count then
								CellResult:set(ReadResult or ReadResult)
								Loading:set("ready")
							end
							local DeferredThread = task.defer(function()
								-- upvalues: ContentProvider (copy), ImageLabelResult (upval), Count1 (copy), Count (upval), MediaMemoModule (upval), p1 (upval), ReadResult (copy), TypesEnum (upval), CellResult (upval), Loading (upval), CellResult1 (upval)
								local Success, Result = pcall(function()
									-- upvalues: ContentProvider (upval), ImageLabelResult (upval), Count1 (upval), Count (upval), MediaMemoModule (upval), p1 (upval), ReadResult (upval), TypesEnum (upval), CellResult (upval), Loading (upval), CellResult1 (upval)
									ContentProvider:PreloadAsync({ ImageLabelResult }, function(_, Success)
										-- upvalues: Count1 (upval), Count (upval), MediaMemoModule (upval), p1 (upval), ReadResult (upval), TypesEnum (upval), CellResult (upval), Loading (upval), CellResult1 (upval)
										if Count1 == Count then
											MediaMemoModule.settle(p1, ReadResult, Success)
										end
										if Success ~= TypesEnum.AssetFetchStatus.Success then
											local Text = tostring(Success)
											
											if Count1 == Count then
												CellResult1:set(Text)
												Loading:set("failed")
											end
										elseif Count1 == Count then
											CellResult:set(ReadResult or ReadResult)
											Loading:set("ready")
											
											return
										end
									end)
								end)
								
								if not Success and Count1 == Count then
									CellResult1:set(Result)
									Loading:set("failed")
								end
							end)
							
							Callback = function()
								-- upvalues: DeferredThread (copy)
								if coroutine.status(DeferredThread) ~= "dead" then
									task.cancel(DeferredThread)
								end
							end
							
							return
						elseif Count1 == Count then
							CellResult:set(ReadResult or ReadResult)
							Loading:set("ready")
						end
					elseif Count1 == Count then
						CellResult:set(ReadResult or ReadResult)
						Loading:set("ready")
						
						return
					end
				elseif Count1 == Count then
					CellResult1:set("empty content")
					Loading:set("failed")
					
					return
				end
			end)
		end
		local OnStatusFunction = p4.onStatus
		
		if OnStatusFunction then
			Compose.watch(function(Callback)
				-- upvalues: OnStatusFunction (copy), Loading (copy), CellResult1 (copy)
				OnStatusFunction(Callback(Loading), Callback(CellResult1))
			end)
		end
		return FrameResult1
	end)
end