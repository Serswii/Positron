<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\BookAuthor */

$this->title = Yii::t('app', 'Create Book Author');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Book Authors'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="book-author-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
