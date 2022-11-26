$training_steps=1600
$train_batch_size=4
$train_text_encoder_for=15
$GC="" # "--gradient_checkpointing"

$stptxt=[int](($training_steps * $train_text_encoder_for)/100/$train_batch_size)
$max_train_steps = [int]($training_steps / $train_batch_size)

Write-Host "stptxt: $stptxt"

accelerate launch train_dreambooth.py `
    --train_text_encoder `
    --train_batch_size=4 `
    --save_starting_step=400 `
    --stop_text_encoder_training=$stptxt `
    --save_n_steps=400 `
    --Session_dir="D:\models\darius" `
    --pretrained_model_name_or_path="runwayml/stable-diffusion-v1-5" `
    --instance_data_dir="D:\models\dariusz_zawadzki\kohya_reg\data\192_radius kawazaki artstyle" `
    --output_dir="./output-512x512" `
    --instance_prompt="Dariusz Zawadzki" `
    --seed=1234 `
    --resolution=512 `
    --mixed_precision="fp16" `
    --train_batch_size=4 `
    --gradient_accumulation_steps=1 $GC `
    --use_8bit_adam `
    --learning_rate=2e-6 `
    --lr_scheduler="polynomial" `
    --lr_warmup_steps=0 `
    --max_train_steps=$max_train_steps