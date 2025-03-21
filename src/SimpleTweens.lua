local RunService = game:GetService("RunService")

local RawTweens = require(script.Parent:WaitForChild("RawTweens"))

local function tweenNumber(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
)
	local delta = 0
	local start = obj[prop]
	local optimalNumber = 1/duration
	repeat
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = func(delta,start,goal,sizeOrAmplitude,period)
	until delta > 1
	obj[prop] = goal
end

local function tweenCFrame(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
)
	local delta = 0
	local start = obj[prop]
	local optimalNumber = 1/duration
	repeat
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = start:Lerp(goal,func(delta,0,1,sizeOrAmplitude,period))
	until delta > 1
	obj[prop] = goal
end

local function tweenVector3(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
)
	local delta = 0
	local start = obj[prop]
	local optimalNumber = 1/duration
	repeat 
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = start:Lerp(goal,func(delta,0,1,sizeOrAmplitude,period))
	until delta > 1
	obj[prop] = goal
end

local function tweenVector2(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
)
	local delta = 0
	local start = obj[prop]
	local optimalNumber = 1/duration
	repeat 
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = start:Lerp(goal,func(delta,0,1,sizeOrAmplitude,period))
	until delta > 1
	obj[prop] = goal
end

local function tweenUDim2(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
) 
	local delta = 0
	local start = obj[prop]
	local optimalNumber = 1/duration
	repeat 
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = start:Lerp(goal,func(delta,0,1,sizeOrAmplitude,period))
	until delta > 1
	obj[prop] = goal
end

local function tweenUDim(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
) 
	local delta = 0
	local start = obj[prop]
	local x1,y1 = start.Scale,start.Offset
	local x2,y2 = goal.Scale,goal.Offset
	local optimalNumber = 1/duration
	repeat 
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = UDim.new(func(delta,x1,x2,sizeOrAmplitude,period),func(delta,y1,y2,sizeOrAmplitude,period))
	until delta > 1
	obj[prop] = goal
end

local function tweenColor3(
	func,
	duration,
	obj,
	prop,
	goal,
	sizeOrAmplitude,
	period
) 
	local delta = 0
	local start = obj[prop]
	local optimalNumber = 1/duration
	repeat 
		delta += RunService.Stepped:Wait()*optimalNumber
		obj[prop] = start:Lerp(goal,func(delta,0,1,sizeOrAmplitude,period))
	until delta > 1
	obj[prop] = goal
end

export type SimpleTweens = {
	tweenNumber:typeof(tweenNumber);
	tweenCFrame:typeof(tweenCFrame);
	tweenVector3:typeof(tweenVector3);
	tweenVector2:typeof(tweenVector2);
	tweenUDim2:typeof(tweenUDim2);
	tweenUDim:typeof(tweenUDim);
	tweenColor3:typeof(tweenColor3);
}

return {
	tweenNumber = tweenNumber;
	tweenCFrame = tweenCFrame;
	tweenVector3 = tweenVector3;
	tweenVector2 = tweenVector2;
	tweenUDim2 = tweenUDim2;
	tweenUDim = tweenUDim;
	tweenColor3 = tweenColor3;
}