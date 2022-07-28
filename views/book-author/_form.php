<?php

use app\models\Author;
use app\models\Books;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\BookAuthor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="book-author-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
        // получаем всех авторов
        $books = Books::find()->all();
        // формируем массив, с ключем равным полю 'id' и значением равным полю 'name'
        $items = ArrayHelper::map($books,'id','title');
        $params = [
            'prompt' => 'Укажите книгу'
        ];
    ?>
    <?= $form->field($model, 'id_book')->dropDownList($items,$params) ?>
    <?php
        // получаем всех авторов
        $authors = Author::find()->all();
        // формируем массив, с ключем равным полю 'id' и значением равным полю 'name'
        $items = ArrayHelper::map($authors,'id','name');
        $params = [
            'prompt' => 'Укажите автора книги'
        ];
    ?>

    <?= $form->field($model, 'id_author')->dropDownList($items,$params) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save', [], 'ru-RU'), ['class' => 'btn btn-success', 'id' => 'save']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
